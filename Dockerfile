#Use and existing docker image as a base
FROM node:alpine
WORKDIR '/app'
COPY package.json /app
RUN npm install
COPY . /app
CMD ["npm","run","dev"]