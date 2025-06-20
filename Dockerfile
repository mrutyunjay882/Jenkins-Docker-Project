FROM centos:7

MAINTAINER vikashashoke@gmail.com

RUN echo ">> Before fixing repos:" && \
    cat /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's/^mirrorlist=/#mirrorlist=/' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo && \
    echo ">> After fixing repos:" && \
    cat /etc/yum.repos.d/CentOS-Base.repo && \
    yum clean all && \
    yum makecache fast

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
 
 
# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip shine.zip
# RUN cp -rvf shine/* .
# RUN rm -rf shine shine.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80   
