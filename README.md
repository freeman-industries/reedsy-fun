Reedsy Fun v1
================

Follow these instructions to get this running.

# Stack
- AngularJS
- Coffeescript

# Installation
    npm install
    npm run build
    cd dist
    python -m SimpleHTTPServer 4040

Then, in your browser go to `http://localhost:4040`

# Operations

#### Build front end
    npm run build

#### Deploy to Github pages
    npm run gh-pages

# missing in this version
If you hit reload on any page other than `/` you get a 404. This is because I am lazy and i used Github pages.

Running a simple express server and pushing to Elastic Beanstalk would sort this.