    FROM node:20-alpine AS base
    WORKDIR /usr/src/app
    
    RUN addgroup -S nodejs && adduser -S nodeuser -G nodejs
    
    COPY package*.json ./
    FROM base AS development
    ENV NODE_ENV=development
    
    RUN npm install    
    COPY . .
    ENV PORT=5921
    EXPOSE 5921
    
    CMD ["npm", "start"]
    FROM base AS production
    ENV NODE_ENV=production
    
    RUN npm install --omit=dev    
    COPY . .
    
    USER nodeuser
    
    ENV PORT=5921
    EXPOSE 5921
    
    CMD ["npm", "start"]
    