#!/bin/bash


reload_nginx() {
    nginx -s reload
    echo "Nginx reloaded"
}

while true; do
    inotifywait -r -e modify,move,create,delete /etc/nginx/
    reload_nginx
done