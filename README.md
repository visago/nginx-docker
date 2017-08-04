# Simple static file server with LDAP support


You'll need your own nginx.conf file !

```
docker run --name nginx -p 80:80 \
  -v /home/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /home/www:/home/www \
  -v /var/log/nginx:/var/log/nginx \
  -d visago/nginx
```

Serves content in /home/www (on host machine) to the public (with auto-index!)


This nginx docker is cleaned up from (https://hub.docker.com/r/h3nrik/nginx-ldap/)

In the http section add
```
ldap_server ldap.example.com {
  url ldap://ldap.example.com/ou=users,dc=domain,dc=com?uid?sub?(objectClass=person);
  binddn "cn=AD,ou=People,dc=domain,dc=com";
  binddn_passwd "00112233445566"; 
  group_attribute memberUid;
  group_attribute_is_dn on;
  require group cn=Gods,ou=Groups,dc=domain,dc=com;
  require valid_user;
  #satisfy any;
}
```


In the server section add 
```
  auth_ldap "LDAP Login";
  auth_ldap_servers ldap.example.com;
```