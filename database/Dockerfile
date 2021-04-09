 FROM node:12-alpine
 RUN node app.js
 WORKDIR /PirateScrolls
 COPY . .
 RUN yarn install --production
 CMD ["node", "src/index.js"]

