.PHONY: deploy install stow undeploy uninstall unlink

MODULES = bash dwm mutt nvim picom tmux vim vis xorg zsh

deploy install stow:
	stow -v $(MODULES)

undeploy uninstall unlink:
	stow -v -D $(MODULES)
