.PHONY: install root-install uninstall

ROOT_MODULES = maintenance xorg-system
MODULES      = bash dwm mutt picom tmux vim xorg zsh scripts git user-dirs

install:
	stow -v $(MODULES)

root-install:
	stow -v $(ROOT_MODULES) -t /

uninstall:
	stow -v -D $(MODULES)
