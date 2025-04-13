# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source files
COPY . .

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
