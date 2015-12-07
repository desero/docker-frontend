#
# Node.js w/ Bower & Gulp runtime Dockerfile
#
# https://github.com/dockerfile/nodejs-bower-gulp-runtime
#

# Pull base image.
FROM node:latest

# Set instructions on build.
# RUN chown -R $USER:$GROUP ~/.npm
RUN npm install -g bower gulp yo generator-frontkick

WORKDIR /home/app
ADD . /home/app
RUN npm cache clean
# RUN id
# RUN pwd
# RUN mkdir /root/.config && mkdir /root/.config/configstore
# RUN chmod g+rwx /root /root/.config /root/.config/configstore
# RUN ls -la /root/.config/configstore
RUN yo frontkick --name="test" --description="yex" --url="rewe" --repo="sfadf"
# RUN gulp build

# Expose ports.
EXPOSE 8080

CMD make run
