# Firefox over VNC
#
# VERSION               0.1
# DOCKER-VERSION        0.2

from	centos:6
# make sure the package repository is up to date
run	echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
run	yum update

# Install vnc, xvfb in order to create a 'fake' display and firefox
run	yum install -y x11vnc xvfb firefox
run	mkdir /.vnc
# Setup a password
run	x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
run	bash -c 'echo "firefox" >> /.bashrc'
