# Autosplitting

This is mostly a page for Speedrunner. It's a breakdown of things you need if you want to use an autosplitter for your runs.

## LiveSplit

The gist of autosplitting with Livesplit is that you either need the USB2Snes Livesplit component or you are fine with the embedded support.

### Included support

This only works for specific versions of some emulators.

Select your game in the edit split window and click on the website button. It should list all the supported emulators, if not
reads the next section to see if something match your setup.

### Usb2Snes Livesplit Component

As the name implies, it's a Livesplit component that supports autosplitting via the USB2Snes Websocket protocol or the NWA protocol.

You can find it at https://github.com/usb2snes/LiveSplit.USB2SNESSplitter. The releases are located here https://github.com/usb2snes/LiveSplit.USB2SNESSplitter/releases

DON'T ACTIVATE THE AUTOSPLITTING IN THE EDIT SPLITS WINDOW. This component acts on its own and needs to be added to your layout, then configured via the layout
configuration.

#### Definitions

You will need a definition file; they can be found at https://github.com/ChTPwner/Usb2Snes-Livesplit-Definitions

#### What is supported

This is a list of setups that work with the component. You will need to refer to the documentation of each project for some
specific options.

- Sd2Snes/FxPak pro : Component + QUsb2Snes/SNI
- RetroArch : Component + QUsb2Snes/SNI
- Snes Classic : Component + QUsb2Snes
- Snes Classic + RetroArch : Component + QUsb2Snes/SNI
- Snes9x-nwa : Component
- Bizhawk + nwa plugin : Component
- Mister : Component + SNID + QUsb2Snes (remote option)

## Other

### Super Metroid

If you are on Linux and want autosplitting for Super Metroid, you can use the Annelid project https://github.com/dagit/annelid
