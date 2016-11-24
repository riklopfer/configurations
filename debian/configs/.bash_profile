if [[ ! ${DISPLAY} && ${XDG_VTNR} == 8 ]]; then
    exec startx
fi
