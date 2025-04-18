FROM mysql:latest

EXPOSE 5655


HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 \
    CMD mysqladmin ping -h localhost -P 5655 --silent

COPY conf/init.sql /docker-entrypoint-initdb.d/
COPY conf/my.cnf /etc/mysql/conf.d/custom.cnf
