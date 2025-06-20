FROM centos:7
MAINTAINER mrutyunjay.sahoo882@gmail.com
# Fix yum repo (CentOS 7 is EOL)
RUN sed -i 's|mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|#baseurl=|baseurl=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|mirror.centos.org|vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo && \
    yum install -y httpd unzip curl && \
    yum clean all
# Set working directory to Apache root
WORKDIR /var/www/html/
# Download working template
RUN curl -L -o snapshot.zip https://assets.free-css.com/download/page293/snapshot.zip && \
    unzip snapshot.zip && \
    cp -rvf snapshot/* . && \
    rm -rf snapshot snapshot.zip
# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 88 22
 
 
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
