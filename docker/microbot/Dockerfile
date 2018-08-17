FROM nginx:alpine
RUN apk add -U sed bash
COPY static-html-directory /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["/bin/bash", "-c", "sed -i \"s/XXX/`hostname -f`/\" /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"]
