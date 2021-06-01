#Use and existing docker image as a base
FROM hypriot/rpi-node:latest
WORKDIR '/app'
#RUN apt update && apt install sudo -y
RUN sudo apt install chromium-browser -y
RUN npm install
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm","run","dev"]
