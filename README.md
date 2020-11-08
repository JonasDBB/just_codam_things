add_aliases.sh:

This will add some essentials for use of the codam computers.

it will add 
- alias to easily clean up your limited disk space
- alias to easily open anything in vscode
- if you have docker installed, but don't have the symlink that changes where it stores all it's data, it will create that, allowing you to use it without issues
- same for minikube
and afterwards it will source your shell, applying everything that was added.

How to use script:
Download the script and run it.

How to use added functions:
`clearhome` will clean up and tell you how much space you had before and have after.
`code <filename/foldername>` will open `filename` or `foldername` in VSCode, for example `code ~/.zshrc` or `code .`

For the docker and minikube symlinks to be setup correctly, the program needs to have run at least once, since that's when it will create the folders that need to be linked to your goinfre.
