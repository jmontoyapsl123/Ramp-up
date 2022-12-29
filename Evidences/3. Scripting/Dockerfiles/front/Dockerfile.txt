FROM node:8.17.0
# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
# Env variables
ENV AUTH_API_ADDRESS = "http://auth:8000"
ENV TODOS_API_ADDRESS = "http://todos-api:8082"
# Bundle app source
COPY . .
EXPOSE 8080
CMD [ "node", "build/dev-server.js" ]