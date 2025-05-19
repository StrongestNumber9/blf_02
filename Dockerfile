FROM rockylinux:8
RUN dnf -y module disable mariadb \
  && dnf -y install wget \
  && wget https://mirror.mariadb.org/yum/11.4/rocky8-amd64/MariaDB.repo -O /etc/yum.repos.d/MariaDB.repo \
  && dnf -y install make automake autoconf libtool MariaDB-devel
WORKDIR /code
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
