# # Use Alpine 3.17 as the base image
# FROM alpine:3.17

# # Install nginx
# RUN apk add --no-cache nginx

# # Create necessary directories
# RUN mkdir -p /run/nginx /etc/nginx/ssl

# # Copy the custom nginx.conf into the image
# COPY conf/nginx.conf /etc/nginx/nginx.conf

# # Copy SSL certificate and key into the image
# COPY conf/nginx.crt /etc/nginx/ssl/

# # Expose ports 80 and 443
# EXPOSE 80 443

# # Start nginx
# CMD ["nginx", "-g", "daemon off;"]


FROM alpine:3.17

# Install NGINX package
# RUN apk add --no-cache nginx

RUN apk update \
    && apk add openssl curl ca-certificates \
    && printf "%s%s%s\n" \
    "http://nginx.org/packages/mainline/alpine/v" \
    `egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
    "/main" \
    | tee -a /etc/apk/repositories \
    && curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub \
    && openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout \
    && mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/ \
    && apk add nginx \
    # dynamic modules일 경우 추가하는 줄
    # sudo apk add nginx-module-image-filter@nginx nginx-module-njs@nginx \
    && rm -rf /var/cache/apk/*

# Generate a self-signed certificate and key
RUN openssl req -x509 -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/conf.d/cert.key \
    -out /etc/nginx/conf.d/cert.crt \
    -subj "/C=KR/L=Seoul/O=42Seoul/CN=dahkang.42.fr"

# Create necessary folders and set permissions
# RUN mkdir -p /run/nginx && \
#     chown -R nginx:nginx /run/nginx

# # Copy custom nginx.conf into the container
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf

# # Copy SSL certificates and private key into the container
# COPY fullchain.pem /etc/nginx/fullchain.pem
# COPY privkey.pem /etc/nginx/privkey.pem

# Expose the HTTP and HTTPS ports
EXPOSE 80 443

# Command to run NGINX
CMD ["nginx", "-g", "daemon off;"]
