# created by Jonas ( jbennink )

# add empty line, in case file doesn't end in newline
echo >> ~/.zshrc

# check if alias clearhome exists and add it

# this will clear your (pretty limited) home directory
# and tell you how much space is available before and after the process
if grep -q "alias clearhome=" ~/.zshrc
then
	echo "clearhome alias already exists"
else
	echo "creating clearhome alias"
	echo "alias clearhome=\"echo -n \\\"Available before:\t\\\"; df -h | grep \$HOME | sed 's/  */:/g' | cut -d ':' -f 4; unsetopt nomatch; rm -Rf ~/Library/*.42_cache_bak*; rm -Rf ~/*.42_cache_bak_*; setopt nomatch; echo -n \\\"Available after:\t\\\"; df -h | grep \$HOME | sed 's/  */:/g' | cut -d ':' -f 4;\"" >> ~/.zshrc
fi


# check if alias code exists and add it

# this alias will let you use "code <file/folder>" to open something in visual studio code
# for example "code ~/.zshrc" will open ~/.zshrc in vscode,
# and "code ." will open the current directory in vscode
if grep -q "alias code=" ~/.zshrc
then
	echo "code alias already exists"
else
	echo "creating code alias for vscode"
	echo "alias code=\"open -a Visual\ Studio\ Code\"" >> ~/.zshrc
fi

# this will check if docker is installed and if it does,
# it will add the symlink if you don't have it yet
# (it checks by grepping if you mention the original directory somewhere in your .zshrc)
# this symlink will make docker use goinfre instead of your (limited) home folder,
# thus avoiding the normally quickly arising issues of not having enough space to use it regularly
if command -v docker &> /dev/null
then
	if grep -q "~/Library/Containers/com.docker.docker" ~/.zshrc
	then
		echo "creating symlink to goinfre for docker"
		echo "rm -rf ~/Library/Containers/com.docker.docker" >> ~/.zshrc
		echo "ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker" >> ~/.zshrc
	else
		echo "docker symlink probably already exists"
	fi
else
	echo "docker is not installed"
fi

# very similar to the docker process
# this will check if minikube is installed and if it does,
# it will add the symlink if you don't have it yet
# (it checks by grepping if you mention the original directory somewhere in your .zshrc)
# this symlink will make minikube use goinfre instead of your (limited) home folder,
# thus avoiding the normally quickly arising issues of not having enough space to use it regularly
if command -v minikube &> /dev/null
then
	if grep -q "~/goinfre/machines" ~/.zshrc
	then
		echo "creating symlink to goinfre for minikube"
		echo "mkdir -p ~/goinfre/machines" >> ~/.zshrc
		echo "rm -rf ~/.minikube/machines" >> ~/.zshrc
		echo "ln -s ~/goinfre/machines ~/.minikube/machines" >> ~/.zshrc
	else
		echo "minikube symlink probably already exists"
	fi
else
	echo "minikube is not installed"
fi

# resource your shell, activating everything that's been added in the previous process
source ~/.zshrc
