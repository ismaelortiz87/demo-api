# Use the official Node.js 16 Alpine image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . .

# Install dependencies
RUN npm ci

# Install PM2 globally
RUN npm install -g pm2

# Expose any required port (e.g., 3000 for typical Node.js apps)
EXPOSE 3000

# Use PM2 to start the application
CMD ["pm2-runtime", "start", "app.js", "--name", "api"]
