#Use and existing docker image as a base
FROM armv7:armhf-ubuntu
WORKDIR '/app'
RUN sudo apt install chromium-browser -y
RUN npm install
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm","run","dev"]
