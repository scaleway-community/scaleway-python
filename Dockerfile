## -*- docker-image-name: "scaleway/python:latest" -*-
FROM scaleway/ubuntu:amd64-xenial
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/ubuntu:armhf-xenial       # arch=armv7l
#FROM scaleway/ubuntu:arm64-xenial       # arch=arm64
#FROM scaleway/ubuntu:i386-xenial        # arch=i386
#FROM scaleway/ubuntu:mips-xenial        # arch=mips


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


COPY ./overlay /


# Create templates to deploy a web environment easily
RUN ln -s /README.txt /root/ \
 && mkdir /var/www \
 && chown www-data:www-data /var/www \
 && rm /etc/nginx/sites-enabled/default


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
