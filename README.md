# configurations
An install script to set up a developer machine with reasonable default settings. This set up is based around Debian and i3wm. `debian_install.sh` will install software on a Debian system. `configure.sh` creates symbolic links in your `$HOME` directory which point to the configuration files in the repository. This way you can track changes to your configurations and also publish useful information for others to find. :)

A lot of the time, one will only want / need to run the configure script since much of the software is already installed. 

# Clone

```bash
git clone https://github.com/riklopfer/configurations.git
```

# Execute bash scripts

```bash
# this installs software
./configurations/debian_install.sh

# this creates links from the cloned git reposity to $HOME 
./configurations/configure.sh
```
# Software installed
This is a list of software that is currently installed via `debian_install.sh`. 

  * Window Manger: [i3](https://i3wm.org/)
  * Terminal Emulator: [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)
  * Text Editor: [sublime-text](https://www.sublimetext.com/3)
  * Webbrowser: [chromium](https://www.chromium.org/Home)
  * Python: 
    * [pip](https://en.wikipedia.org/wiki/Pip_(package_manager))
      * [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/)

# Configuration files provided
Not all configuration files are used -- e.g. terminator. 

  * i3
    * `.config/i3/config`
    * `.config/i3status/config`
  * urxvt
    * `.Xresources`
  * terminator
    * `.config/terminator/config`
  * bash
    * `.bashrc`
    * `.pastebinit.xml`

# Things to add
These things should probably be added.

  * java
  * intellij
