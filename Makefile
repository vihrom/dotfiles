.PHONY: deploy install stow undeploy uninstall unlink

deploy install stow:
	stow -v bash dwm mutt nvim picom tmux vim vis xorg zsh

undeploy uninstall unlink:
	stow -v -D bash dwm mutt nvim picom tmux vim vis xorg zsh
