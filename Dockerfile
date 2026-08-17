# Use an official Node.js runtime as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies inside the container
RUN npm install

# Copy the rest of the application source code
COPY . .

# Expose the port your Express app runs on
EXPOSE 4000

# Specify the command to run your app
CMD ["npm", "start"]
