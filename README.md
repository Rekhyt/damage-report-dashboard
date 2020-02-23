# damage-report-dashboard
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/Rekhyt/damage-report-dashboard.svg?branch=master)](https://travis-ci.org/Rekhyt/damage-report-dashboard)
[![Latest Tag](https://img.shields.io/github/v/tag/rekhyt/damage-report-dashboard?style=flat)](https://github.com/Rekhyt/damage-report-dashboard/releases)

Damage report, Bob.

A simple dashboard displaying data from the [damage-report service](https://github.com/Rekhyt/damage-report).

## Run Locally
### Configuration
* `EXPOSED_PORT_API` - port via which the damage-report service API will be reachable (Default: `8000`)
* `EXPOSED_PORT_BOARD` - port via which the damage-report dashboard will be reachable (Default: `3000`)
* `REACT_APP_API_URL` - URL to the damage-report service API (Default: `http://localhost:8000`)

### Docker Compose (Recommended)
To run the whole stack, including API and dashboard:
`docker-compose up -d`

To only run the dashboard and service API on another machine in the LAN:
`REACT_APP_API_URL=http://192.168.1.12:8000 docker-compose up -d`

### Natively
To run the board on your local system:<br />`npm start`

Specify a service API location different from http://localhost:8000:<br />
`REACT_APP_API_URL=http://192.168.1.12:8000 npm start`

## Build
### Configuration
* `BUILD_PRODUCTION` - whether to create an optimized production build (*) (Default: "true")
* `API_URL` - URL to the damage-report service API (**) (Default: `http://localhost:8000`)
* `TAG` - name of the image tag to be built (Default: `damage-report-dashboard:development`)

(\*) This takes a while, so if you only need a development version you should set this to "false".<br />
(**) This will only affect the production build where the URL can't be changed after the build has finished.

### Build & Run
`BUILD_PRODUCTION=true API_URL=http://192.168.1.12:8000 ./build.sh`

To run the production build:<br />
`docker run --rm -d -p 3000:3000 damage-report-dashboard:development`

To run the development version:<br />
`docker run --rm -d -p 3000:3000 damage-report-dashboard:development npm start`

Note that you can still supply a different damage-report service API URL to the development version but not to the
production build.

Examples:

This will work with the passed API URL:<br />
`docker run --rm -d -p 3000:3000 -e REACT_APP_API_URL=http://192.168.1.5 damage-report-dashboard:development npm start`

This will have no effect and run with the API URL that was used during build:<br />
`docker run --rm -d -p 3000:3000 -e REACT_APP_API_URL=http://192.168.1.5 damage-report-dashboard:development`