FROM cgr.dev/chainguard/node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 4200

CMD ["npm", "start"]