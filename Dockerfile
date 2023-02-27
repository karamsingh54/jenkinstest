FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install zip httpd unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/foste.zip  /var/www/html
WORKDIR /var/www/html
RUN unzip foste.zip
RUN rm -rf foste.zip &&\
      cp -rf html/* . &&\
      rm -rf html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
