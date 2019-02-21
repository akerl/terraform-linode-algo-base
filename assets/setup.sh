#!/usr/bin/env bash

set -euo pipefail

resize2fs /dev/sda

export DEBIAN_FRONTEND=noninteractive

rm /etc/ssh/ssh_host*
ssh-keygen -A

apt update
apt upgrade -y
apt autoremove -y
apt install -y python-pip build-essential python-dev python-virtualenv

systemctl restart sshd

ALGO_DIR=/opt/algo
if [[ ! -e "$ALGO_DIR" ]] ; then
    git clone "${algo_repo}" "$ALGO_DIR"
fi

(
    cd "$ALGO_DIR"

    if [[ "$(git remote get-url origin)" != "${algo_repo}" ]] ; then
        echo "Repo in image is not the expected repo"
        exit 1
    fi

    git pull

    [[ ! -e env ]] && virtualenv env
    export PS1=""
    source env/bin/activate
    pip install --force-reinstall --no-cache-dir -r requirements.txt
)
