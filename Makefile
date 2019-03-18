
help:
	@echo -e "Odin Ugedal - Dotfiles"
	@echo -e "Commands:"
	@echo -e " - vim"
	@echo -e " - all"
	@echo -e " - atom"
	@echo -e " - tmux"
	@echo -e " - zsh"
	@echo -e " - xorg"
	@echo -e " - atom"
	@echo -e " - atom-packages-restore"
	@echo -e " - atom-packages-backup"
	@echo -e " - arch-backup"
	@echo -e " - arch-restore"
	@echo -e " - alacritty"
	@echo -e " - term"
	@echo -e " - archlive"
	@echo -e " - gitconfig"
	@echo -e " - dockerconfig"

all:
	make vim tmux zsh xorg alacritty 

vim:
	@mkdir -p ~/.vim ~/.VIM_TMP_FILES ~/.VIM_BACKUP_FILES ~/.VIM_UNDO_FILES ~/.VIM_DIRECTORY_FILES
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
	bin/git-clone-or-sync https://github.com/jonmosco/kube-tmux ~/.tmux/plugins/kube-tmux
	bin/git-clone-or-sync https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
	~/.tmux/plugins/tpm/bin/update_plugins all

zsh:
	stow zsh
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
	mkdir -p ~/.oh-my-zsh/custom/plugins/
	bin/git-clone-or-sync https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

term:
	stow term

xorg:
	stow xorg

atom:
	stow atom
	# Run `make atom-packages-restore` to install packages

alacritty:
	stow alacritty

gitconfig:
	stow gitconfig

dockerconfig:
	stow docker

atom-packages-restore:
	apm-beta install --packages-file   atom/.atom/package.list

atom-packages-backup:
	apm-beta list --installed --bare > atom/.atom/package.list

arch-backup:
	pacman -Qqetn > archlinux/pkglist.txt
	pacman -Qqetm > archlinux/pkglist-aur.txt

archlive:
	rm -rf archlive
	cp -r /usr/share/archiso/configs/releng/ archlive
	cat archlinux/pkglist-liveiso.txt >> archlive/packages.x86_64
	echo "cd /root/dotfiles                   " >> archlive/airootfs/root/customize_airootfs.sh
	echo "mv ../.zshrc ../.zshrc-old || true  " >> archlive/airootfs/root/customize_airootfs.sh
	echo "make term zsh vim tmux              " >> archlive/airootfs/root/customize_airootfs.sh
	echo "pacman -Rns grml-zsh-config         " >> archlive/airootfs/root/customize_airootfs.sh
	mkdir -p archlive/airootfs/etc/skel/
	git clone .git archlive/airootfs/etc/skel/dotfiles
	cd archlive && ./build.sh -v

arch-restore:
	sudo pacman -S --needed - < archlinux/pkglist.txt
	@echo "Remember to install yay"
	yay -S --needed - < archlinux/pkglist-aur.txt

.PHONY: vim tmux zsh xorg help atom atom-packages-restore atom-packages-backup arch-backup arch-restore alacritty gitconfig dockerconfig archlive term all
