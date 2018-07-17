FROM node:latest

# Changed owner of work directory to node
# To resolve:
# Error: EACCES: permission denied, mkdir '/home/onenote-dev/foo'
# This is from changing user to node on line 38 for running yo office

RUN mkdir /home/onenote-dev \
&& chown node:node /home/onenote-dev \
&& cd /home/onenote-dev

WORKDIR /home/onenote-dev  

# install as root
RUN npm install markdown-it --save


# install as root
RUN npm install -g yo generator-office


# NOTE:
# npm installs have to run in root  
# 
# However running `yo office` shouldn't be in root
# RUN by default runs as root. 

USER node

# If user was not switched to node, you'll get the following error, otherwise this
# resolves, Error: EACCES: permission denied, open '/root/.config/insight-nodejs/insight-yo.json'
#
# changing chmod-x to insight-yo.json did not work
#
# we've noticed that in the docs, that yo office was not run as root in the examples,
# so we've looked at existing users in the node:latest image by running
# `cat /etc/passwd` and found the node user
# took a chance and tried running as the node user, we do not understand the underlying issue,
# since `insight-yo.json` was set as root:root 


# Giving inputs to` yo office` in the format below did not work:
#
# RUN sh -c 'echo Jquery\nJavascript\nMy Office Add-in\n | yo office'

# Look at https://github.com/OfficeDev/generator-office on how to use "office" 
RUN yo office jquery "My_OneNote_Add-in" onenote --js

# RUN cat /etc/os-release 


# Latest version of Yeoman & Yeoman generator for Office Add-ins 
# https://docs.microsoft.com/en-us/office/dev/add-ins/onenote/onenote-add-ins-getting-started
