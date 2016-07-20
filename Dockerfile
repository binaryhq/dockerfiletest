FROM tutum/lamp:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl

RUN rm -fr /app && git clone https://github.com/username/customapp.git /app

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
RUN cd /var/www/ && tar xvf latest.tar.gz && rm latest.tar.gz
RUN cp -rf  /var/www/wordpress/* /app
RUN rm -rf /var/www/wordpress
RUN rm /var/www/html/index.html
RUN chown -R www-data:www-data /var/www/


EXPOSE 80 3306
CMD ["/run.sh"]
