#!/bin/bash
reload_nginx() {
  service nginx restart
}
inotifywait -m /etc/nginx/conf.d/default.conf | while read path action file; do
  sleep 15
  reload_nginx
done