FROM node:16 AS builder

WORKDIR /build

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:16 AS deployment

WORKDIR /app

RUN npm install sirv-cli

RUN npm install sirv

COPY package*.json ./

COPY --from=builder /build/ ./

EXPOSE 8080

CMD ["npm", "run", "start"]

# CMD ["sirv", "public", "--no-clear", "-p", "8080"]

# CMD ["sirv", "-p", "8080"]