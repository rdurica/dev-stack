# ENV
DOCKER_COMP = docker compose

cert:
	mkcert -key-file certs/tls.key -cert-file certs/tls.crt mail.localhost

init:
	if [ ! -f build/dev/certs/tls.crt ]; then mkcert -key-file certs/tls.key -cert-file certs/tls.crt mail.localhost; fi
		  docker network inspect apps >/dev/null 2>&1 || docker network create apps;
		  @$(DOCKER_COMP) build --pull --no-cache;
		  @$(DOCKER_COMP) up --detach;
