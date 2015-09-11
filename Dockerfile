## -*- docker-image-name: "scaleway/python:latest" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update \
 && apt-get -y -qq upgrade \
 && apt-get purge -y python.* \
 && apt-get -y -qq install \
        emacs vim \
        git mercurial subversion \
        python python3 \
        python-setuptools \
        libmysqlclient-dev python-dev \
        libpq-dev \
        nginx \
        uwsgi uwsgi-plugin-python \
 && apt-get clean


# Install common python development libraries
RUN easy_install \
    coverage \
    nose \
    pep8 \
    pip \
    pylint \
    unittest-xml-reporting \
    virtualenv \
    virtualenvwrapper


ADD ./patches/README.txt /
RUN ln -s /README.txt /root/


# Create templates to deploy a web environment easily
RUN mkdir /var/www
RUN chown www-data:www-data /var/www


ADD ./patches/etc/nginx/sites-available/my_website /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default


ADD ./patches/etc/uwsgi/apps-available/my_django_project.ini /etc/uwsgi/apps-available/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
