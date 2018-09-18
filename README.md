# rig

This repo contains `install.sh` which installs software under different Linux distributions. It also contians a separate `configure.sh` wihch creates symbolic links in your `$HOME` directory which point to the configuration files in the repository. This way you can track changes to your configurations and also publish useful information for others to find. Additionally, you don't have to worry as much when moving to a new machine because you can just reclone and rerun the set up scripts. 

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

Running these setup scripts multiple times should not change the final state of the machine. However, if configurations were removed or renamed, it will leave some orphaned links. Those can be removed with the following command:

```bash
find -L ~/ -type l -delete
```

# Software installed

Generally speaking we will install the following. 

  * [i3 window manager](https://i3wm.org/)
  * dunst
  * [urxvt terminal emulator](http://software.schmorp.de/pkg/rxvt-unicode.html)
  * [sublime-text text editor](https://www.sublimetext.com/3)
  * Google Chrome web browser 
  * Dropbox
  * [geary email client](https://wiki.gnome.org/Apps/Geary)
  * [taskwarrior todo list](https://taskwarrior.org/)
  * Python, Pip, numpy, reqs for tensorflow
  * Java 8


# Configuration files 

Configurations are separated into [default](resources/configure/default) and [host-specific](resources/configure/host) configuration files. The default configurations are installed for all hosts then overwritten by the host-specifc configuration files. 


