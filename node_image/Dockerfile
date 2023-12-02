# Use an official Node.js runtime as a parent image
FROM node:20.9.0-alpine3.17

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json (if available) into the working directory
COPY package*.json ./

# Install any needed packages
RUN npm install

# Copy the rest of the application code into the working directory
COPY . .

# Make port 7000 available to the world outside this container
EXPOSE 4002

# Define the command to run your app using CMD which defines your runtime
# Here, we use the command 'node' to execute the file 'index.js'
CMD [ "npm", "start" ]