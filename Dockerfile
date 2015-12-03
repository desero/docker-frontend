#
# Node.js w/ Bower & Gulp runtime Dockerfile
#
# https://github.com/dockerfile/nodejs-bower-gulp-runtime
#

# Pull base image.
FROM node:latest

# Set instructions on build.
ONBUILD RUN npm install -g yo bower gulp generator-frontkick --allow-root
ONBUILD ADD package.json /app/
ONBUILD RUN npm install
ONBUILD ADD bower.json /app/
ONBUILD RUN bower install
ONBUILD ADD . /app
ONBUILD RUN yo frontkick
ONBUILD RUN gulp build

# Define working directory.
WORKDIR /app/src

# Define default command.
CMD ["npm", "-v"]

# Expose ports.
EXPOSE 8080
