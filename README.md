# Simple static file server

```
docker run -d --name=nginx -v /opt/www:/www -p 80:80 visago/nginx
```

Serves content in /opt/www (on host machine) to the public (with auto-index!)

