FROM node:10.15-alpine

WORKDIR /var/app

COPY package.json index.js controller.js ./
RUN yarn install --production

ENTRYPOINT node index.js

EXPOSE 3001