FROM node:16-alpine as builder

WORKDIR /app

COPY package.json . 
RUN npm install

COPY . .
RUN npm run build

# Debugging step: list the contents of the build directory
RUN ls -al /app/build

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html
