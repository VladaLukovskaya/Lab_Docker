FROM debian
ADD amistupid.list /etc/apt/sources.list.d/
MAINTAINER Livada <lukovskis2808@gmail.com>
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install nginx && \
    apt-get clean && \
    rm -rf /var/www/* && \
    mkdir -p /var/www/livada.com/img && \
    chmod -R 754 /var/www/livada.com/ && \
    useradd Vlada && \
    groupadd Lukovskaya && \
    usermod -aG Lukovskaya Vlada && \
    chown -R Vlada:Lukovskaya /var/www/livada.com/ && \
    sed -i 's/\/var\/www\/html/\/var\/www\/livada.com/g' /etc/nginx/sites-enabled/default && \
    sed -i 's/user www-data/user Vlada/g' /etc/nginx/nginx.conf
ADD img.jpg /var/www/livada.com/img/
ADD index.html /var/www/livada.com/
CMD ["nginx", "-g", "daemon off;"]
