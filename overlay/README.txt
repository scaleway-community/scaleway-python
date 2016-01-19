The intended audience of this image is Python developers who want to bootstrap
or test a Python application easily, in seconds.

Common packages have been installed:

- various SCM: git, mercurial, svn
- system wide dependencies of Python package `mysql-python`
  (libmysqlclient-dev, python-dev).  You can then run `pip install
  mysql-python`.
- system wide dependencies of Python package `psycopg2` (libpq-dev,
  python-dev). You can then run `pip install psycopg2`.
- `virtualenv`, so you can isolate your development environment


Also, a web environment is bootstrapped so you can deploy your web
application easily.


EXAMPLE: run a Django web application
=====================================

This image makes it super easy to deploy your Django application, with nginx
and uWSGI. The commands below can also be used to deploy another Python web
application.

First of all, install Django and create your project:

    $> pip install django
    $> cd /var/www
    $> django-admin startproject my_django_project

Then, enable the nginx template to configure the virtualhost:

    $> ln -s /etc/nginx/sites-available/my_website /etc/nginx/sites-enabled/

Also, you need to enable the uWSGI template:

    $> ln -s /etc/uwsgi/apps-available/my_django_project.ini /etc/uwsgi/apps-enabled/

Finally, restart services:

    $> service uwsgi restart
    $> service nginx restart

And you can open your browser and visit your IP to view your super new website!

IMPORTANT NOTE: you may want to customize the nginx and uWSGI configuration
templates we provided! We created these files only to help, because it's always
a pain to setup a web stack.

Useful links:

* Setup Django with uWSGI and nginx:http://uwsgi-docs.readthedocs.org/en/latest/tutorials/Django_and_nginx.html
* Options of uWSGI configuration files: http://uwsgi-docs.readthedocs.org/en/latest/Options.html
* nginx configuration: http://wiki.nginx.org/Configuration


WHAT'S NOT
==========

This image doesn't contain databases, because we can't really know which one
you prefer.

To install MySQL, run:

    $> apt-get install mysql-server

And/or PostgreSQL:

    $> apt-get install postgresql


SUGGESTIONS
===========

If you think something is missing in this image, or if it would have been
easier if you had this or that tool, or if this <whatever> should be configured
that way instead of how it currently is, we'd love to hear from you!

You can make an issue and/or a pull request on:

        https://github.com/scaleway-community/scaleway-python

❤
