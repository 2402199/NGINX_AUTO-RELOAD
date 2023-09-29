FROM nginx
RUN apt update -y
RUN apt install -y nano inotify-tools
COPY /index1.html /usr/share/nginx/html
VOLUME [ "/etc/nginx/" ]
COPY ./nginxreload.sh /
RUN chmod +x /nginxreload.sh
ENTRYPOINT [ "/nginxreload.sh" ]
