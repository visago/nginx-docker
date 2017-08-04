# Simple static file server

```
docker run --name nginx -p 80:80 \
  -v /home/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /home/www:/home/www \
  -v /var/log/nginx:/var/log/nginx \
  -d visago/nginx
```

Serves content in /home/www (on host machine) to the public (with auto-index!)


This nginx docker is cleaned up from (https://hub.docker.com/r/h3nrik/nginx-ldap/)
```