help:
	@echo -e "Odin Ugedal - Dotfiles"
	@echo -e "Commands:"
	@echo -e " - vim\n\tSetup vim and download all deps"
	@echo -e " - zsh\n\tSetup zsh and download all deps"
	@echo -e " - tmux\n\tSetup tmux and download all deps"
	@echo -e " - misc\n\tSetup xorg and other misc stuff"
	@echo -e " - archlinux\n\tInstall awesome archlinux stuff"

vim:
	@./script/vim

tmux:
	@./script/tmux

zsh:
	@./script/zsh

misc:
	@./script/misc

archlinux:
	@./script/archlinux

.PHONY: vim tmux zsh misc archlinux help
