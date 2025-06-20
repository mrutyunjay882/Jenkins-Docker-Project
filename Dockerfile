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
# Install dependencies
# Install Apache, curl, and unzip
RUN yum update -y && \
    yum install -y httpd curl unzip && \
    curl -Lo snapshot.zip https://assets.free-css.com/download/page293/snapshot.zip && \
    unzip snapshot.zip && \
    cp -rvf snapshot/. /var/www/html/ && \
    rm -rf snapshot snapshot.zip
# Expose Apache default port
EXPOSE 80
# Start Apache
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
