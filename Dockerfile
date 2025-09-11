FROM node:18

WORKDIR /app

COPY package.json package-lock.json ./

# Fix chokidar and PostCSS issues
RUN npm install chokidar@3 postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps

RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 3000
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000

CMD ["npm", "start"]
