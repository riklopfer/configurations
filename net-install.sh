#!/usr/bin/env bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git 

[ -d ${HOME}/Git ] || mkdir -p ${HOME}/Git/ 
if [ -d ${HOME}/Git/rig ]; then
    git pull ${HOME}/Git/rig
else
    git clone https://github.com/riklopfer/rig.git ${HOME}/Git/rig
fi

${HOME}/Git/rig/install.sh 2>&1 | tee log.rig-install; test ${PIPESTATUS[0]} -eq 0
${HOME}/Git/rig/configure.sh 2>&1 | tee log.rig-configure; test ${PIPESTATUS[0]} -eq 0
