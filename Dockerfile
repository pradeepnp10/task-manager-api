FROM node:18

WORKDIR /app

# Copy only package.json to ensure proper layer caching
COPY package.json ./

RUN echo "=== Package.json contents ===" && cat package.json && echo "=== End package.json ==="

RUN npm install

# Now copy the rest of the app
COPY . .

RUN echo "=== Final package.json contents ===" && cat package.json && echo "=== End final package.json ==="

EXPOSE 3000

CMD ["npm", "start"]
