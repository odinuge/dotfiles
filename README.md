# dotfiles
> Dotfiles for vim, zsh, tmux and other misc. stuff

![image of uxterm](dotfiles.png)

## About
This is my dotfiles. I use uxterm, with tmux, zsh & vim.

__Includes__:
- vim
- tmux
- zsh
- misc (xorg ++)
- List of must-have archlinux packages


 To inspect install scripts, look inside the `scripts/` folder.

## Install
```
$ make <whatyouwant>
```

_Example_: Install vim, zsh & tmux config
```
$ make vim zsh tmux
```

## Help

```
$ make help

Odin Ugedal - Dotfiles
Commands:
 - vim
	Setup vim and download all deps
 - zsh
	Setup zsh and download all deps
 - tmux
	Setup tmux and download all deps
 - misc
	Setup xorg and other misc stuff
 - archlinux
	Install awesome archlinux packages
```

### Archlinux
> Will give you a list of must-have packages, and allows you to
> modify it before installing. You can also append packages you
> want.

```
$ make archlinux
```

## License
MIT © [Odin Ugedal](mailto:odin@ugedal.com)
