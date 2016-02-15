#!/bin/bash

###
# Build Script
# Use this script to build theme assets,
# and perform any other build-time tasks.
##

# Install PHP dependencies (WordPress, plugins, etc.)
composer install

# Build our theme assets
cd web/app/themes/twelve/
npm install -g bower gulp-cli
echo "{ \"allow_root\": true }" > /root/.bowerrc
npm install
bower install
gulp --production

# Clean up – remove node packages now that we've compiled our assets
# This will save ~250MB of disk space!
rm -R node_modules