FROM node:8.17.0
# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
ENV JWT_SECRET="PRFT"
ENV TODO_API_PORT=8082 
COPY . .
EXPOSE 8082
CMD [ "node", "server.js" ]