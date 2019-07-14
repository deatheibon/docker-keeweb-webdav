# deatheibon/keeweb-webdav

Free cross-platform password manager compatible with KeePass.
https://keeweb.info/

This image supports WebDAV, this makes possible to store/sync password files on the same container.

Note: Over WebDAV, KeeWeb can update files but can't currently create them, the files must exist.

- Alpine-based
- no TLS support, reverse proxy with TLS recommended

## Usage

First, start KeeWeb (`/my/password-files` must contain the password file):
```bash
docker run -d -p 443:443 -e WEBDAV_USERNAME=webdav -e WEBDAV_PASSWORD=secret -v /my/password-files:/var/www/html/webdav deatheibon/keeweb-webdav
```

## SSL

Using own ssl certificate:
```bash
docker run -d -p 443:443 -e WEBDAV_USERNAME=webdav -e WEBDAV_PASSWORD=secret -v /my/password-files:/var/www/html/webdav -v /my/certificate/file:/etc/lighttpd/certs/lighttpd.pem:ro deatheibon/keeweb-webdav
```

Then, go to KeeWeb through your browser, click on `More`, click on `WebDAV` and enter your configuration:
```
URL: https://example.com/webdav/filenanme
Username: webdav
Password: secret
```
