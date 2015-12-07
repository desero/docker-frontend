#
# Node.js w/ Bower & Gulp runtime Dockerfile
#
# https://github.com/dockerfile/nodejs-bower-gulp-runtime
#

# Pull base image.
FROM node:latest

# Set instructions on build.
RUN npm install -g yo bower gulp generator-frontkick --allow-root
# ADD package.json /app/
# RUN npm install
# ADD bower.json /app/
# RUN bower install
# ADD . /app
RUN yo frontkick --name='Application' --description='Docker generated application' --url='app.local' --repo='git@github.com:desero/docker-frontend.git'
RUN gulp build

# Define working directory.
WORKDIR /app/src

# Define default command.
CMD ["npm", "-v"]

# Expose ports.
EXPOSE 8080
