# Pull the base image
___ node:7.7-alpine

# Install dependencies
## Change the working directory with the container
___ /tmp/
## Import the package.json
___ package.json .
## Install dependencies via command
___ npm install

# Copy dependencies
## Change the working directory within the container
___ /opt/to-do-app/
## Move the dependencies over
___ cp -a /tmp/node_modules .

# Moving over more files
## Import the JavaScript files
___ server.js .
___ initialize.js .
## Change the working directory within the container
___ /opt/to-do-app/dist/
# Import the dist directory
___ dist .

## Launch the node app
___ ["sh", "-c", "node initialize && node server"]
