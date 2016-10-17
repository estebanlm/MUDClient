# MUDClient [![Build Status](https://travis-ci.org/estebanlm/MUDClient.png?branch=master)](https://travis-ci.org/estebanlm/MUDClient)
A client to play MUDs (The ones I play :P), made in [Pharo](http://pharo.org).

<img src="https://raw.githubusercontent.com/estebanlm/themes/master/images/MUDClient.png" alt="MUDClient ScreenShot" width="600px">

## Features
It implements several features:

- A complete Telnet client
- Parsers for common telnet protocols: ANSI, ...
- Parsers for MUD telnet protocols: MSDP, ...

### Available plugins
- **Buttonpad**: program buttons and key combinations.
- **Notepad**: keep your game notes.
- **Alias**: define alias for repetitive tasks.
- **Filter** move chats, etc. to special windows.
- **Triggers**: define triggers on events.

#### Legends of the Jedi (http://www.legendsofthejedi.com)
- **LOTJ Status bar**: visualise data (health, movement, enemy health, etc.) using a graphic view.

*Next:*
- **Timers**: define triggers on time based events.
- **Log viewer**: review all your game sessions.
- **Bot**: Automate tedious tasks.
- **Cartographer**: Draw your maps.

##License
For now, license is [GPL3](LICENSE.txt) (but I'm just starting to play with is so there is no much to see)

# Install
MUDClient is early development, but you can install and play with it: 

    $ wget -O- get.pharo.org/50+vm | bash
    $ ./pharo Pharo.image eval --save "
        Metacello new 
            repository: 'github://estebanlm/MUDClient/mc';
            baseline: 'MUDClient';
            load. 
		MUDApplication install.
        MUDTerminal open."
    $ ./pharo-ui Pharo.image &   

