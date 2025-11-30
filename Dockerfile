FROM alpine:latest

RUN apk update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /usr/share/nginx/html && \
    echo "<h1>Application Deployed via Terraform IaC!</h1>" > /usr/share/nginx/html/index.html

RUN echo "server { listen 80; root /usr/share/nginx/html; index index.html; }" > /etc/nginx/http.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
