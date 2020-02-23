const { useState, useEffect, useRef } = React;

function Connection() {
    const network = useRef(null);
    const [device, setDevice] = useState(null);
    const [log, setLog] = useState('');

    function updateLog(text) {
        setLog(log => log ? `${log}\n${text}` : text);
    }

    useEffect(() => {
        network.current = create_network({ setState: setDevice, log: updateLog });
    }, []);

    function onConnect() {
        network.current.onConnect();
    }

    if (device == null)
        return null;

    return <React.Fragment>
        <button style={{ display: 'block' }} disabled={device.state === 1} onClick={onConnect}>Connect</button>
        <textarea style={{ width: '800px', height: '250px' }} readOnly={true} value={log} />
        {device.state === 1 &&
            <p>App version: {device.app_version || '<loading>'}</p>
        }
        {device.state === 1 &&
            <p>{device.list.length ? 'Devices:' : 'No devices found'}</p>
        }
        <ul>
            {device.list.map((entry, i) =>
                <li key={i}>{entry.name}: {entry.info || '<loading>'}</li>
            )}
        </ul>
    </React.Fragment>;
}

ReactDOM.render(
    React.createElement(Connection),
    document.getElementById('app')
);
