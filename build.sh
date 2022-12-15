#!/bin/bash
set -e

# run script only as root
if [ $(id -u) != 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# set proxy
export http_proxy="http://proxy-chain.intel.com:911"
export https_proxy="https://proxy-chain.intel.com:911"

# install required packages
apt-get update
apt-get install -y gcc python-dev python-virtualenv

# create and activate virtual environment
virtualenv venv
source venv/bin/activate

# install latest version of pip
wget -Oget-pip.py https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm -r get-pip.py

# upgrade setuptools
pip install setuptools --upgrade

# install pybuilder
pip install pybuilder
chmod +x venv/bin/pyb

# install dependencies
pip install -r requirements-build.txt
pip install -r requirements.txt

# execute build
pyb clean
pyb -X

user="${SUDO_USER:-$USER}"
group=`groups $user | awk -F' ' '{print $3}'`
# change ownership of venv and target directories
chown -R $user:$group venv
chown -R $user:$group target
