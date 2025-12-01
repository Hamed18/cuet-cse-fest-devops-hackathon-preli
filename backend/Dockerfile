 FROM node:20-alpine

WORKDIR /usr/src/app

RUN addgroup -S nodejs && adduser -S nodeuser -G nodejs
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

USER nodeuser


ENV PORT=3847
EXPOSE 3847

CMD ["npm", "start"]
