# 1. Base Image: Use the minimal Alpine Linux node runtime
FROM node:18-alpine

# 2. Set internal working directory
WORKDIR /usr/src/app

# 3. Copy package files first to leverage Docker layer caching
COPY package*.json ./

# 4. Install dependencies inside the container
RUN npm install

# 5. Copy the rest of the application code
COPY . .

# 6. Document the port the server listens on
EXPOSE 5000

# 7. Default command to run the API
CMD ["node", "server.js"]