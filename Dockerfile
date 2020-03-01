FROM centos:7

RUN yum update -y

# install apache httpd
RUN yum install -y httpd gettext

# copy in config
RUN mkdir -p /conf
ADD config/dav.conf /etc/httpd/conf.d/dav.conf

# add statup script
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

# run httpd
CMD [ "/run-httpd.sh" ]
