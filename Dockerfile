FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . .
CMD npm  run build

#/app/build <----- all the stuff we care about would be in this directory

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#nginx  starts autmatically so we dont have have CMD to start nginx