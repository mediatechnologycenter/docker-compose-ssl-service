# pull official base image for the first build step
FROM node:16-alpine as build-step

# add `/app/node_modules/.bin` to $PATH
# Change the workdir to a seperate folder
WORKDIR /front-end
# Create an env variable for the node modules path
ENV PATH /front-end/node_modules/.bin:$PATH
# install app dependencies by firstly copying them and installing them
COPY package.json yarn.lock ./
COPY ./src ./src
COPY ./public ./public
RUN yarn install --network-timeout=30000
RUN yarn build

# Nginx has a cmd command to run the application by default
FROM nginx:stable-alpine
# We copy the created build file to the ngnix folder
COPY --from=build-step /front-end/build /usr/share/nginx/html
# Copy the nginx config file to be used in docker container
COPY deployment/nginx.default.conf /etc/nginx/conf.d/default.conf

