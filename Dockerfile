FROM node:20


# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the application
RUN yarn run build

# Install serve globally
RUN yarn global add serve

# Expose port 8080
EXPOSE 8080


# Set the entry point to start the application, binding to all interfaces
CMD ["serve", "-s", "build", "-l", "8080"]

