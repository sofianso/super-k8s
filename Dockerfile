FROM node:alpine

# Create app directory
WORKDIR /app

EXPOSE 4000

COPY package.json package-lock.json ./

RUN npm install

COPY . ./

CMD [ "npm", "start" ]