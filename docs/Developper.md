Usb2snes can refer to two protocols, The low level protocol on the sd2snes firmware itself and the Usb2snes websocket protocol. This document mainly focus on the Websocket protocol.

If you want to learn more about the firmware serial com protocol, you should have a look at the Sd2snes device code in the QUsb2snes project, the comment in the file explain how it work.


# FAQ and Pitfalls

## How the firmware access memories?

The Sd2snes act like a snes cartridge so it has access to the main bus. The ROM and SRAM are directly on the sd2snes so the firmware can direclty read and write to them. For the WRAM the firmware keep a copy of what it saw on the main bus on the FGPA ram, so when you read, you read from this copy. Writing the WRAM only do write on the copy and not in the WRAM of the snes.

## How to write to the WRAM?

For the sd2snes only: The firmware has a special location to store SNES bytecode that will be run on the Sd2snes MNI, so to write on the WRAM you need to write some instructions like ˋlda #$42;sta $60ˋ in the CMD Space


## How fast are read? Can I do subframe read?

This depends a lot on the device. A Sd2snes can have small read that take 15 ms or more, or less (depends on the system)

For emulator with a lua script, read/write are done each frame (The script read the socket each frame) so it's pretty unreliable

SNES Classic : read/write are done via writing on the emu memory, they take 1-2 ms

NWA: Depends on the emulator, but should be at max a frame time

So basicly it's mostly unreliable.

## Are write atomic/reliable?

Not really, if you are writing a multiworld/coop thing the recommand way is to let your game do the work. Multitroid inject code in a Super Metroid rom to be able to run snes code from the sram, then sync are done by writing in this sram space
