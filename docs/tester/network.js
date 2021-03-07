function create_network(react) {
    const snes = usb2snes();

    let socket = null;

    const device = initial_device();

    updateState();

    function initial_device() {
        return {
            state: 0,
            app_version: '',
            list: [],
        };
    }

    function updateState() {
        react.setState(_.cloneDeep(device));
    }

    function socket_onclose() {
        react.log('Connection closed');
        snes.clearBusy();

        if (device.state !== 0) {
            setTimeout(onConnect, 1000);
            react.log('Trying to reconnect');
        }

        Object.assign(device, initial_device());
        updateState();
    }

    async function onConnect() {
        try {
            if (device.state === 1) {
                device.state = 0;
                updateState();
                socket.close();
                return;
            }

            socket = await snes.connect('ws://localhost:8080');
            socket.onclose = socket_onclose;

            react.log('Connected to websocket');
            device.state = 1;
            updateState();

            let response;

            response = await snes.send(snes.create_message('AppVersion', []));
            const app_version = JSON.parse(response.data).Results;

            device.app_version = app_version[0];
            updateState();

            response = await snes.send(snes.create_message('DeviceList', []));
            const device_list = JSON.parse(response.data).Results;

            device.list = device_list.map(name => ({ name, info: null }));
            updateState();

            if (device.list.length === 0) {
                /* Set to 1 to signal a reconnect to socket_onclose */
                device.state = 1;
                socket.close();
                return;
            }

            try {
                let i = -1;
                for (const name of device_list) {
                    i += 1;
                    device.list[i].info = JSON.stringify(await deviceInfo(name));
                    updateState();
                }
            } catch (error) {
                react.log(`Could not attach to device: ${error}`);
                /* Set to 1 to signal a reconnect to socket_onclose */
                device.state = 1;
                socket.close();
            }
        }
        catch (error) {
            react.log(`Could not connect to the websocket, retrying: ${error}`);
            device.state = 0;
            updateState();
            setTimeout(onConnect, 5000);
        }
    }

    async function deviceInfo(device) {
        const attached = await snes.send(snes.create_message('Attach', [device]), true, 500);
        if (attached === true) {
            const response = await snes.send(snes.create_message('Info', []));
            return JSON.parse(response.data).Results;
        }
    }

    return { onConnect };
}

// Probably not needed, but left here just in case
function ushort_le_value(array, offset) {
    return array[offset] + (array[offset + 1] << 8);
}

function ushort_le_bytes(x) {
    return [x & 0xFF, (x >> 8) & 0xFF];
}
// ---
