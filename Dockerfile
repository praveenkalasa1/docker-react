FROM node:current-alpine3.16 as builder

WORKDIR /usr/app
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/app/share/nginx/html

