#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade -y
apt install -y ansible python-pip build-essential python-dev python-virtualenv

local ALGO_DIR=/opt/algo

if [[ ! -e "$ALGO_DIR" ]] ; then
    git clone "${algo_repo}" "$ALGO_DIR"
fi

cd "$ALGO_DIR"
git pull

[[ ! -e env ]] && python -m virtualenv env
export PS1=""
source env/bin/activate
pip install -r requirements.txt
