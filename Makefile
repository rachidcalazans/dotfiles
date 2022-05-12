MAKEFLAGS += --silent

install:
	mkdir -p ~/.scripts/
	@echo "Installing brew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo "Installing dependencies"
	brew install tmux python3 ctags zsh git vim fzf xclip autojump ripgrep
	@echo "Creating directory for undodir vim plugin"
	mkdir -p ~/.vim/undodir
	@echo "Linking config files"
	ln -sfn ~/.dotfiles/tmux.conf ~/.tmux.conf
	ln -sfn ~/.dotfiles/config/vim ~/.config/
	ln -sfn ~/.dotfiles/scripts/setup_rvm.sh ~/.scripts/setup_rvm.sh
	echo '\n#RVM on tmux fix\n[ -f ~/.scripts/setup_rvm.sh ] && source ~/.scripts/setup_rvm.sh' >> ~/.zshrc
	@echo "Installing vim-plug"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "Installing Vim plugins"
	vim +'PlugInstall --sync' +qa
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
	
