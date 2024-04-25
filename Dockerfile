FROM cgr.dev/chainguard/node:latest

WORKDIR /app

COPY package*.json /app

RUN npm install

COPY . /app

RUN npm run build

EXPOSE 4200

CMD ["npm", "start"]