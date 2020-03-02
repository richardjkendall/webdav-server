FROM centos:latest

RUN yum update -y

# install apache httpd
RUN yum install -y httpd gettext

# copy in config
RUN mkdir -p /conf
ADD config/dav.conf /etc/httpd/conf.d/dav.conf

# create folders for dav root and lockdb
RUN mkdir -p /dav/{db,root}
RUN chown apache:apache /dav/db
RUN chmod 700 /dav/db

# add statup script
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

# run httpd
CMD [ "/run-httpd.sh" ]
