FROM redis:alpine
VOLUME [ "/data" ]
WORKDIR /data
COPY ./redis/redis.conf /usr/local/etc/redis/
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
EXPOSE 6379