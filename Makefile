help:
	@echo -e "Odin Ugedal - Dotfiles"
	@echo -e "Commands:"
	@echo -e " - vim"
	@echo -e " - atom"
	@echo -e " - tmux"
	@echo -e " - zsh"
	@echo -e " - xorg"
	@echo -e " - atom"
	@echo -e " - atom-packages-restore"
	@echo -e " - atom-packages-backup"

vim:
	@mkdir -p ~/.vim ~/.VIM_TMP_FILES ~/.VIM_BACKUP_FILES ~/.VIM_UNDO_FILES
	stow vim
	@./script/info.sh "Downloading Plug"
	@curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	@./script/info.sh "Downloading vim plugins"
	vim +PlugInstall +qa
	vim +PlugUpdate +qa

tmux:
	stow tmux
	@./script/info.sh "Download tpm - Tmux Plugin Manager"
	bin/git-clone-or-sync https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
	~/.tmux/plugins/tpm/bin/update_plugins all

zsh:
	stow zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	(cd ~/.oh-my-zsh/custom/plugins && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git || true)

xorg:
	stow xorg

atom:
	stow atom
	# Run `make atom-packages-restore` to install packages

atom-packages-restore:
	apm-beta install --packages-file   atom/.atom/package.list

atom-packages-backup:
	apm-beta list --installed --bare > atom/.atom/package.list

.PHONY: vim tmux zsh xorg help atom atom-packages-restore atom-packages-backup
