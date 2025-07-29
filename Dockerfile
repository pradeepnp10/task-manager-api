# Use an official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy and verify package files
COPY package*.json ./
RUN echo "=== package.json ===" && cat package.json && echo "=== END ==="

# Install dependencies
RUN npm install

# Copy all other source code
COPY . .

# Expose port
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
