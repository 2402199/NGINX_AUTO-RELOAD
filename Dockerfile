FROM nginx
RUN apt update -y
RUN apt install -y nano inotify-tools
COPY /index1.html /usr/share/nginx/html
VOLUME [ "/etc/nginx/conf.d" ]
COPY ./reload.sh /
RUN chmod +x /reload.sh
# ENTRYPOINT [ "/reload.sh" ]
CMD ["sh", "-c", "nginx -g 'daemon off;' & sh /reload.sh & wait"]
