MAKEFLAGS += --silent

install:
	mkdir -p ~/.scripts/
	@echo "Installing command line tools for Xcode"
	xcode-select --install
	@echo "Installing brew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo "Installing dependencies"
	brew install tmux python3 ctags zsh git curl vim fzf xclip autojump ripgrep
	@echo "Installing RVM gpg"
	gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	@echo "Installing RVM with stable ruby"
	curl -sSL https://get.rvm.io | bash -s stable --ruby
	@echo "Creating directory for undodir vim plugin"
	mkdir ~/.vim/undodir
	@echo "Linking config files"
	ln -sfn ~/.dotfiles/tmux.conf ~/.tmux.conf
	ln -sfn ~/.dotfiles/config/vim ~/.vim/config/
	ln -sfn ~/.dotfiles/scripts/setup_rvm.sh ~/.vim/scripts/setup_rvm.sh
	echo '\n#RVM on tmux fix\n[ -f ~/.scripts/setup_rvm.sh ] && source ~/.vim/scripts/setup_rvm.sh' >> ~/.zshrc
	# @echo "Installing vim-plug"
	# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	# 	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# @echo "Installing Vim plugins"
	# vim +'PlugInstall --sync' +qa
	cd ~/.fzf/ && ./install
	@echo "Done!"

vim_update:
	@echo "Creating a backup of the current plugins versions"
	vim +'PlugSnapshot! plugins.bkp' +qal > /dev/null
	@echo "Updating plugins"
	vim +'PlugInstall --sync' +PlugUpdate +qall
	@echo "\nRun 'make vim_plugins_rollback' to reinstall the previous plugins versions"
	@echo "Done!\n"

vim_plugins_rollback:
	@echo "Rolling back the plugins versions"
	vim +'source plugins.bkp' +qal
	@echo "Rollback finished with success!\n"
	