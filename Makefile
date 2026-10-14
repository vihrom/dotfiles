.PHONY: install root-install uninstall

# ROOT_MODULES = xorg-system nftables # for security purposes it's install as copy file (not symlink)
MODULES      = bash dwm mutt picom tmux vim xorg zsh scripts user-dirs mime

install:
	stow -v ${MODULES}

root-install:
	sudo cp -r xorg-system/etc/* /etc/
	sudo cp -r nftables/etc/* /etc/
	sudo chown -R root:root /etc/X11/xorg.conf.d/
	sudo chmod 644 /etc/X11/xorg.conf.d/00-keyboard.conf
	sudo chown root:root /etc/nftables.conf
	sudo chmod 600 /etc/nftables.conf

uninstall:
	stow -v -D ${MODULES}
