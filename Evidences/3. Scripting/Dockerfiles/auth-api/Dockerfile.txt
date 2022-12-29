FROM golang:1.18.2
# Create app directory
WORKDIR /usr/src/app
ENV GO111MODULE=on
ENV JWT_SECRET="PRFT"
ENV AUTH_API_PORT=8000
ENV USERS_API_ADDRESS="http://user-api:8083"
# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
RUN go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
RUN go mod tidy
COPY . .
RUN go build
EXPOSE 8000
CMD ["./auth-api"]