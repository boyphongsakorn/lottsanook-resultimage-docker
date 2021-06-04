#Use and existing docker image as a base
FROM node:12-alpine
WORKDIR '/app'
RUN apk add font-noto-thai
RUN apk update; apk add curl
RUN apk add --no-cache chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm","run","dev"]
