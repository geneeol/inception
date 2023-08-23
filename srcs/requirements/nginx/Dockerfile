# FROM nginx:stable-alpine
 
# WORKDIR /var/www/html
 
# COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
 
# CMD ["nginx", "-g", "daemon off;"]

# Use Debian as the base image
FROM debian:bullseye

# Install Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose Nginx default port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
