---
layout: default
title: USB2SNES
---

USB2SNES is way to communicate with the SNES or devices (including some emulators) that act like a SNES

# Contents
{:.no_toc}

* TOC
{:toc}

# Origins

## USB2SNES firmware

USB2SNES is a firmware for the SD2SNES cartridge written by Redguyy that allows to use the USB port on the SD2SNES to access various functionality of the SD2SNES.
Most notable are uploading ROM, read and write various memories of the console.

The issue with this approach, when writing application that use this technology only one application can have access to the SD2SNES.
So for example you cannot run an Item tracker for ALTTP randomizer at the same time than the fileviewer to upload a new ROM.

![Direct access](images/directaccess.png)

To avoid this issue, Redguyy wrote an intermediary application also called USB2SNES that other application use to talk to the SD2SNES.

So a basic usage look like that:

![Websocket access](images/wsaccess.png)

## Emulators, SNES Classic...

Since then an alternative implementation called [QUsb2Snes](https://skarsnik.github.io/QUsb2snes/) has added support for other backends including SNES Emulators or SNES Classic

For example Snes9x

![Lua connection](images/luaconnection.png)


# Supported platforms

Intermediate software
* [USB2SNES](https://github.com/RedGuyyyy/sd2snes/releases) (Windows)
* [QUsb2Snes](https://skarsnik.github.io/QUsb2snes/) (Windows, MacOS, Linux)

Different choices of platforms that is supported

Platform | [USB2SNES](https://github.com/RedGuyyyy/sd2snes/releases) | [QUsb2Snes](https://skarsnik.github.io/QUsb2snes/)
---------|----------|----------
SD2SNES with the [USB2SNES](https://github.com/RedGuyyyy/sd2snes/releases) firmware|✔|✔
[Snes9x Multitroid](https://drive.google.com/open?id=1_ej-pwWtCAHYXIrvs5Hro16A1s9Hi3Jz) with Lua support|❌|✔
SNES Classic modded with [Hakchi2 CE](https://github.com/TeamShinkansen/hakchi2/releases)|❌|✔
[Bizhawk 2.3.1](https://github.com/TASVideos/BizHawk/releases)|❌|✔
RetroArch support with Snes9x and bsnes-mercury cores|❌|✔

# Getting started

## Downloads

### Windows

You can download a bundle on [usb2snes github releases page](https://github.com/usb2snes/usb2snes/releases/latest). This include the latest QUsb2Snes, the latest USB2SNES firmware and a bunch of applications to have something ready to use.

### Mac os X

For Mac os X users you will need to grab a QUsb2Snes dmg on [QUsb2Snes releases page](https://github.com/Skarsnik/QUsb2snes/releases), sadly other applications does not have a Mac os X release yet.

### Linux

You will need to compile yourself see [QUsb2Snes Linux Readme](https://github.com/Skarsnik/QUsb2snes/blob/master/LinuxREADME.md)

## Installation

Download the file corresponding to your operating system, then follow the instructions on the Readme or on [QUsb2Snes usage](https://skarsnik.github.io/QUsb2snes/#usage)

## Tutorials

Coming soon (tm)

# Getting help

The best way to get help is to join the Usb2snes discord at [Usb2Snes](https://discord.gg/2JgefTX) and contact ask your question.

There is also a [connection tester page](tester/index.html) that can help with verifying that QUsb2snes is accessable and can find devices.

# Applications

## Multitroid
Multitroid is a mod for Super Metroid that allows multiple players to complete the game cooperative, they can share energy, ammo, items, equipment, events and map across different platforms

See [Multitroid.com](http://www.multitroid.com/) for more information	

## Savestate2snes
[Savestate2snes](https://skarsnik.github.io/Savestate2snes/) is a tool that let you create and manage savestates on your SNES console with a SD2SNES.
It also support ‘hacked’ SNES classic with hakchi2 CE  

## QFile2Snes

Provided with [QUsb2Snes](https://skarsnik.github.io/QUsb2snes/), QFile2Snes is a software to mainly access your files on your SD2SNES, It's a more 'modern' replacement for the Fileviewer provided with the original `USB2SNES`. It support Drag and Drop for example.

## Fileviewer (legacy)
Included with [USB2SNES](https://github.com/RedGuyyyy/sd2snes/releases)

This application allows you access your SD2SNES files and perform some special operation, like starting a game, applying a patch.

## MemoryView
Included with [USB2SNES](https://github.com/RedGuyyyy/sd2snes/releases)

This application allow you to have a look at various memory of your SNES and overwrite value if you want.

## InputViewer
Included with the bundle, it's a patched [NintendoSpy](https://github.com/jaburns/NintendoSpy) that use some memory value of your device to display the buttons your press.
It has some limitations like not showing input during screen transition and such.

# Developers

If you don't plan on doing a complex application, you can look at the [Magic2Snes](https://github.com/Skarsnik/Magic2snes/wiki) project. It's a project written toward making small application easier by hiding all the Usb2Snes specific behind simple call like `memory.readByte()`

If you want more details about the Usb2Snes websocket protocol you need too look at the [Protocol](https://github.com/Skarsnik/QUsb2snes/blob/master/docs/Procotol.md) page of the QUsb2Snes project.
