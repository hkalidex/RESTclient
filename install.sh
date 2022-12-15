export http_proxy=http://proxy-chain.intel.com:911
export https_proxy=http://proxy-chain.intel.com:911

apt-get update
apt-get install -y wget git python-dev gcc python-pip
pip install pip==9.0.1 --upgrade
pip install setuptools --upgrade
pip install git+https://github.intel.com/ase-internal/RESTclient.git --process-dependency-links