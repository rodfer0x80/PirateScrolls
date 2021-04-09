FROM node:latest
RUN mkdir /app
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "app.js"]
