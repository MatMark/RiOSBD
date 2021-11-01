FROM mysql:5.7

ARG server_id

ENV MYSQL_ROOT_PASSWORD=$server_id
ENV MYSQL_USER=$server_id
ENV MYSQL_PASSWORD=$server_id
ENV MYSQL_DATABASE="TEST"

RUN touch /etc/mysql/conf.d/my.cnf
RUN echo "[mysqld]" >> /etc/mysql/conf.d/my.cnf
RUN echo "server_id=$server_id" >> /etc/mysql/conf.d/my.cnf
RUN echo "log_bin=/var/log/mysql/mysql-bin.log" >> /etc/mysql/conf.d/my.cnf
RUN echo "binlog_format=mixed" >> /etc/mysql/conf.d/my.cnf
EXPOSE 3306