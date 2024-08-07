FROM node:20


# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Set the entry point to start the application
CMD ["serve", "-s", "build", "-l", "8080"]
