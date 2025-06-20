FROM centos:7
MAINTAINER mrutyunjay.sahoo882@gmail.com
# Fix CentOS 7 yum repo due to EOL (uses vault.centos.org)
RUN sed -i 's|mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|#baseurl=|baseurl=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|mirror.centos.org|vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo && \
    yum install -y httpd zip unzip curl && \
    yum clean all
# Download and extract the template
WORKDIR /var/www/html/
RUN curl -L -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose HTTP and optional SSH (if needed)
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
