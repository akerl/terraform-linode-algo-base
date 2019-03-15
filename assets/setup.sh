#!/usr/bin/env bash

set -euo pipefail

resize2fs /dev/sda

export DEBIAN_FRONTEND=noninteractive

rm /etc/ssh/ssh_host*
ssh-keygen -A

apt update
apt upgrade -y
apt autoremove -y
apt install -y python-pip build-essential python-dev python-virtualenv tmux vim-minimal git diff-so-fancy

systemctl restart sshd

ALGO_DIR=/opt/algo
[[ -e "$ALGO_DIR" ]] && rm -rf "$ALGO_DIR"
git clone "${algo_repo}" "$ALGO_DIR"

