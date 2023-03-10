# ==== CONFIGURE =====
# Use Node 18.9.1 base image
FROM node:18.9.1-alpine 
# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files
COPY dist /app/dist
# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
# install serve globally
RUN npm install --global serve 
# Build the app
#RUN npm run build
# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production
# Expose the port on which the app will be running (3000 is the default that `serve` uses)
EXPOSE 3000
# add a user
USER 10014
# Start the app
CMD [ "serve","-s", "dist" ]
