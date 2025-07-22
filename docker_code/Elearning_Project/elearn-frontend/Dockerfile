FROM node AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:stable-alpine-perl
COPY --from=build /app/build /usr/share/nginx/html







# FROM node AS build
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build
# FROM nginx:stable-alpine-perl
# COPY --from=build /app/build* /usr/share/nginx/html
# EXPOSE 80
# ENTRYPOINT [ "nginx", "-g", "daemon off;" ]





# FROM node:14  
# # Set working directory inside container
# WORKDIR /akkc
# # Copy application files to the container
# COPY . .
# # Install dependencies and build the application
# RUN npm install
# RUN npm run build
# # Install Nginx
# RUN apt update && apt install -y nginx
# # Copy the build files to Nginx's default web directory
# # RUN cp -r build/* /usr/share/nginx/html/ 
# # Use /var/www/html because the default Nginx web directory is /var/www/html
# RUN cp -r build/* /var/www/html
# # Expose port 80 (container-side port)
# EXPOSE 80
# # Start Nginx in the foreground to serve the static files
# CMD ["nginx", "-g", "daemon off;"]
