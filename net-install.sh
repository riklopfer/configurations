#!/usr/bin/env bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git 
mkdir -p ${HOME}/Git/ 
git clone https://github.com/riklopfer/rig.git ${HOME}/Git/rig
${HOME}/Git/rig/install.sh 2>&1 | tee log.rig-install
${HOME}/Git/rig/configure.sh 2>&1 | tee log.rig-configure