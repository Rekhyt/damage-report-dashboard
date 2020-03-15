# damage-report-dashboard
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/Rekhyt/damage-report-dashboard.svg?branch=master)](https://travis-ci.org/Rekhyt/damage-report-dashboard)
[![Latest Tag](https://img.shields.io/github/v/tag/rekhyt/damage-report-dashboard?style=flat)](https://github.com/Rekhyt/damage-report-dashboard/releases)

Damage report, Bob.

A simple dashboard displaying data from the [damage-report service](https://github.com/Rekhyt/damage-report).

![Example](https://raw.githubusercontent.com/rekhyt/damage-report-dashboard/master/assets/example.jpg)

## Quick Start
To run the dashboard as a local service:

    npm install && REACT_APP_API_URL=<API URL> npm run build && npm run production

Or in a Docker container:

    API_URL=<API URL> ./build.sh && docker run --rm -d -p 3000:3000 damage-report-dashoard

## Development
* `PORT` - port that the web server will listen on (Default: `3000`)
* `REACT_APP_API_URL` - URL to the damage-report service API (Default: `http://localhost:8000`)

### Running Locally
To run the development server locally:

    npm install && REACT_APP_API_URL=<API URL> npm run development

### Running via Docker Compose (Recommended)
To run dashboard and service in a development Docker stack:

    docker-compose up -d

Additional configuration:
* `EXPOSED_PORT_API` - port via which the damage-report service API will be reachable (Default: `8000`)
* `EXPOSED_PORT_BOARD` - port via which the damage-report dashboard will be reachable (Default: `3000`)
* `REACT_APP_API_URL` - URL to the damage-report service API (Default: `http://localhost:8000`)

## Building
### Locally

    REACT_APP_API_URL=<API URL> npm run build

### Docker
#### Configuration
* `BUILD_PRODUCTION` - whether to create an optimized production build (Default: "true")
* `API_URL` - URL to the damage-report service API (Default: `http://localhost:8000`)
* `TAG` - desired image tag name (Default: `development`)

#### Build
Use the `build.sh` or `build-arm.sh` script to build an amd64 or armv7 image:

    API_URL=<API URL> ./build.sh
    API_URL=<API URL> ./build-arm.sh
