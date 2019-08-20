# Specify a base image
FROM node:alpine as builder

# Creation of a working directory called app
WORKDIR '/app'

# Install some dependencies

# Copying package.json file to the working directory of /app

COPY package.json .

# Run npm install to install all of our dependencies

RUN npm install

# Copying all files and directories from the project directory to the working directory

COPY . .

# Default command to start the project

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


