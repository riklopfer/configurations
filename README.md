# configurations
An install script to set up a developer machine with reasonable default settings. This set up is based around Debian and i3wm. `install.sh` will install software on the current system. `configure.sh` creates symbolic links in your `$HOME` directory which point to the configuration files in the repository. This way you can track changes to your configurations and also publish useful information for others to find. :)

A lot of the time, one will only want / need to run the configure script since much of the software is already installed. 

# Clone

```bash
git clone https://github.com/riklopfer/rig.git
```

# Execute bash scripts

```bash
# this installs software
./rig/install.sh

# this creates links from the cloned git reposity to $HOME 
./rig/configure.sh
```

# Software installed
Currently, [debian](resources/install/debian) contains he most up-to-date [packages.list](resources/install/debian/packages.list). This will install everything you need starting from a base system (no desktop).

Here are some highlights from [packages.list](resources/intall/debian/packages.list)
  * Window Manger: [i3](https://i3wm.org/)
  * Terminal Emulator: [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)
  * Text Editor: [sublime-text](https://www.sublimetext.com/3)
  * Webbrowser: [chromium](https://www.chromium.org/Home)
  * Python: 
    * [pip](https://en.wikipedia.org/wiki/Pip_(package_manager))
      * [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/)
  * Java 8



# Configuration files 

Configurations are separated into [default](resources/configure/default) and [host-specific](resources/configure/host) configuration files. The default configurations are installed for all hosts then overwritten by the host-specifc configuration files. 

# TODO

 * automatically install intellij
