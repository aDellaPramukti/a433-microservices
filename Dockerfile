FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install --production --unsafe-perm

COPY . .

RUN npm run build

ENV NODE_ENV=production DB_HOST=item-db

EXPOSE 8080

CMD ["npm", "start"]
