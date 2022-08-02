FROM node:16-alpine

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --no-cache
COPY . .
EXPOSE 3000
CMD [ "node", "app.js" ]
