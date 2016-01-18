Tippler Store v1
================

Follow these instructions to get Tippler running.

# Stack
- NodeJS
- npm
- AngularJS (bundled in storefront)
- Coffeescript

# Installation
    npm install

# Operations

#### Build storefront & run server (all in one command)
    PORT=XXXX npm run start

#### Running the server
    PORT=XXXX npm run server

#### Building the storefront
    npm run storefront

# Running in production - initialize and run

    npm install
    sudo npm install -g grunt-cli
    sudo PORT=80 npm run start