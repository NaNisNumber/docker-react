#specify a base image 
FROM node:14-alpine as stage1

WORKDIR /app

#install dependencies
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=stage1 /app/build /usr/share/nginx/html
#default runcommand of nginx is to start it, so we dont need to mention it
