# Use Node 20 as the base
FROM node:20

# Set the working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies (ignoring lockfile issues)
RUN npm install --package-lock=false

# Copy the rest of your files
COPY . .

# Force the server to listen on 0.0.0.0 and port 8080
ENV HOST=0.0.0.0
ENV PORT=8080

# Expose the port for Koyeb
EXPOSE 8080

# Start the proxy
CMD ["npm", "start"]

