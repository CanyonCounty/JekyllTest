#Rebuild Jekyll site on push

  - create a git repository on the remote server
    - mkdir <projectname>.git
    - cd <projectname>.git
    - git init --bare
  - copy the post-receive.sh to <projectname>.git/hooks and remove the .sh extension
  - configure project to use the new remote
    - git remote add <name> <location>
    - git push <name> <branch|master>

