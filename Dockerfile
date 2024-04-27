FROM cgr.dev/chainguard/node:latest

WORKDIR /app

COPY --chown=node:node package*.json ./ 

RUN npm install

COPY --chown=node:node . .

RUN npm run build

EXPOSE 4200

CMD ["npm", "start"]