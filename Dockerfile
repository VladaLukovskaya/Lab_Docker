FROM debian
ADD amistupid.list /etc/apt/sources.list.d/
MAINTAINER Livada <lukovskis2808@gmail.com>
RUN apt-get update && apt-get -y upgrade && apt-get -y install nginx && \
    apt-get clean && cd /var/www/ && rm -rf ./* && mkdir livada.com/img && \
    
RUN
EXPOSE
