# Dev Stack
[![Docker](https://img.shields.io/badge/Docker-powered-blue.svg)](https://www.docker.com/)

![Image](https://github.com/user-attachments/assets/c6468bf8-2ad3-43da-8526-b6721fbcb25f)

Containerized local stack for common infrastructure dependencies (databases, cache, mail, messaging). Built to be disposable, reproducible, and easily integrated with your application containers via the shared Docker network.

For PHP development, you can pair this with my [PHP Starter Kit](https://github.com/rdurica/php_starter_kit).

---

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Make](https://www.gnu.org/software/make/) (to use `make` targets)
- [mkcert](https://github.com/FiloSottile/mkcert) (to generate trusted TLS certificates for Mailpit)

---

## Getting Started

```bash
make init
```

What this does:
- Creates the external Docker network `apps` if it does not already exist.
- Builds/pulls images and starts all services in detached mode.
- Ensures TLS certificates for Mailpit are present in `certs/tls.crt` and `certs/tls.key`. You can also run `make cert` manually if you need to recreate them.

---

## Services

**Mailpit**
- Web UI: https://mail.localhost:8443/ (uses the local mkcert certificate)
- SMTP: localhost:1025
- Internal host: `mailpit` (SMTP port 1025)

**MariaDB**
- Host: localhost:3306
- Internal host: `mariadb`:3306
- User: `root`
- Password: `password`

**PostgreSQL**
- Host: localhost:5432
- Internal host: `postgres`:5432
- User: `root`
- Password: `password`

**Redis (Redis Stack)**
- Web UI: http://localhost:8001/ (RedisInsight)
- Internal host: `redis`:6379 (password: `password`)
- Data: `./data/redis`
- Note: Redis TCP port 6379 is available only on the Docker network by default.

**RabbitMQ**
- Management UI: http://localhost:15672/
- Internal host: `rabbitmq`:5672
- User: `root`
- Password: `password`
- Note: AMQP port 5672 is exposed within the network; only the management UI is published to the host.

All containers join the shared `apps` network, so you can attach your own application containers to the same network for seamless communication.

---

## Notes
- Intended for local development only.
