#!/bin/bash
cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=(Apache "Open source HTTP servers" off
         Nginx "Open source HTTP server and reverse proxy " off
         Python "FullPackage python enveroment for quick start" off
         Git "Git revision control and source code managment" off
         Mercurial "Mercurial revision contorl and source code managment" off
         MySQL "Open source database" off
         PostgreSQL "Open source database" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
#sudo apt-get update
#sudo apt-get upgrade
for choice in $choices
do
    case $choice in
        Apache)
           sudo apt-get install apache2-mpm-worker apache2-dev libapache2-mod-wsgi libapache2-mod-python
           ;;
        Nginx)
           sudo apt-get install nginx-full nginx uwsgi uwsgi-plugin-python
        Python)
           sudo apt-get install python python-setuptools python-dev virtualenv virtualenvwrapper
           sudo apt-get install python-pip 
           sudo apt-get install sqlite3
           sudo pip install django-fab-deploy jinja2 fabric
           echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bashrc
           echo "export DJANGO_SITES_ROOT=$HOME/projects" >> ~/.bashrc
           echo "source /usr/bin/virtualenvwrapper.sh" >> ~/.bashrc
           mkdir ~/projects
           ;;
        Git)
           sudo apt-get install git-core
           ;;
        Mercurial)
           sudo apt-get install mercurial
           ;;
        MySQL)
           sudo apt-get install mysql-server mysql-client
           ;;
        PostgreSQL)
           sudo apt-get install postgresql postgresql-client postgresql-server-dev-all
           sudo -u postgres psql
           ;;
    esac
done
