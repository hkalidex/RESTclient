![alt text](https://ubit-teamcity-iag.intel.com/app/rest/builds/buildType:%28id:AseInternal_RESTclient%29/statusIcon "TC Build Status Icon")  [![Build Status](https://fms01lxuthub01.amr.corp.intel.com/api/badges/ase-internal/RESTclient/status.svg)](https://fms01lxuthub01.amr.corp.intel.com/ase-internal/RESTclient)


## RESTclient
A Python client providing primitive methods for consuming a REST API. The intent of this class is for it to be inherited by other subclasses


#### Installation
```bash
wget -O install.sh https://github.intel.com/raw/ase-internal/RESTclient/master/install.sh
chmod +x install.sh
sudo ./install.sh
```


#### Usage
```bash
$ python
>>> from RESTclient import RESTclient
>>> client = RESTclient('location of REST api', username='user', password='pass')

# GET request
>>> client.get('/rest/endpoint1')

# POST request
>>> client.post('/rest/endpoint2', json_data={'a1': 'v1'})

# PUT request with noop
>>> client.put('/rest/endpoint3', json_data={'a1': 'v1'}, noop=True)

# DELETE request with no SSL verification
>>> client.delete('/rest/endpoint4', verify=False)

```


#### Development Server Installation

Clone the repository
```bash
git clone https://github.intel.com/ase-internal/RESTclient.git
cd RESTclient
```

Install packages and dependencies
```bash
chmod +x build.sh
sudo ./build.sh
source venv/bin/activate
```

Build the application
```bash
pyb
```

Link module for development
```bash
cd target/dist/RESTclient*/
python setup.py develop
```

Run unit tests
```bash
pyb run_unit_tests
```


### Development using Docker ###

For instructions on installing Docker:
https://github.intel.com/EnterpriseDocker/docker-auto-install-scripts

Clone the repository to a directory on your development server:
```bash
cd
git clone https://github.intel.com/ase-internal/RESTclient.git
cd RESTclient
```

Build the Docker image
```bash
docker build -t restclient:latest  .
```

Run the Docker image
```bash
docker run \
--rm \
-v $HOME/RESTclient:/RESTclient \
-it \
restclient:latest \
/bin/bash
```
Note: Run the image with the source directory mounted as a volume within the container; this will allow changes to be made to the source code and have those changes reflected inside the container where they can be tested using pybuilder

Execute the build
```bash
pyb -X
```