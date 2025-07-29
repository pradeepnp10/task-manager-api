# Use an official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./

# Debug: Show what was copied
RUN echo "=== Package.json contents ===" && cat package.json && echo "=== End package.json ==="

RUN npm install

# Copy rest of the code
COPY . .

# Debug: Show final package.json
RUN echo "=== Final package.json contents ===" && cat package.json && echo "=== End final package.json ==="

# Expose the port the app runs on
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
