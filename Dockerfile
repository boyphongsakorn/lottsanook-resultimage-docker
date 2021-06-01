#Use and existing docker image as a base
FROM node:alpine
WORKDIR '/app'
RUN sudo apt install chromium-browser -y
RUN npm install
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm","run","dev"]
