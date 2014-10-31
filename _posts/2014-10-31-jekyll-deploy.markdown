---
layout: default
title:  "Jekyll Deploy"
date:   2014-10-31 13:14:39
---

[Jekyll](http://jekyllrb.com/) seems pretty cool. I've played with it a bit. I didn't want to just FTP the _site directory to some server, I wanted to automate the process.

I followed several examples on getting it to work with Heroku without any luck. So I then decided to go the even crazier way and that was doing the Git post-receive hook as defined on [this page](http://jekyllrb.com/docs/deployment-methods/)

However, in order to do that I had to:

- Create a Ubuntu Virtual Machine
- Install git (sudo apt-get install git)
- Install nginx [Install](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-14-04-lts), [Configure Virtual Hosts](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-14-04-lts). Be sure to set up /var/www/<host> as explained here.
- Install OpenSSH (sudo apt-get install openssh-server) [More Info](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring)
- Copy my .pub ssh key into ~/.ssh/authorized_keys
- Edit my local box's ~/.ssh/config to include the pub key
        Host <hostname>
          HostName <hostname again>
          IdentityFile ~/.ssh/<non pub key>
          IdentitiesOnly yes
- Configure the Uncomplicated Firewall (sudo ufw enable, sudo allow 22, sudo allow 80) [More Info](https://help.ubuntu.com/12.04/serverguide/firewall.html)
- Created a new git repo on the Ubuntu box
        ```
        
        cd ~
        mkdir myrepo.git
        cd myrepo.git
        git --bare init
        
        ```
- Created a $myrepo/hooks/post-receive file with the following contents. Notice that PUBLIC_WWW is the directory you created configuring Nginx.
        ```
        
        #!/bin/sh
        GIT_REPO=$HOME/myrepo.git
        TMP_GIT_CLONE=$HOME/tmp/myrepo
        PUBLIC_WWW=/var/www/<host>/html
        git clone $GIT_REPO $TMP_GIT_CLONE
        jekyll build -s $TMP_GIT_CLONE -d $PUBLIC_WWW
        rm -Rf $TMP_GIT_CLONE
        exit
        
        ```
- Added the Ubuntu box as a git remote
        ```
        git remote add deploy <user>@<host>~/myrepo.git
        ```
- Pushed to the new remote
        ```
        git push deploy master
        ```
- Whew - I think that's it...

Nothing too major, but it wasn't too bad either. Now that I have that working, it's time to really get into jekyll.

