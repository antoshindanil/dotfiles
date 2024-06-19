all:
	mkdir -p ~/.config
	make base
	make git
	make asdf

base:
	ln -sf $(PWD)/.bashrc ~/.bashrc
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -snf $(PWD)/config/htop ~/.config/
	ln -snf $(PWD)/config/nvim ~/.config/
	ln -snf $(PWD)/config/kitty ~/.config/

git:
	git remote set-url origin git@github.com:antoshindanil/dotfiles.git

packages: base-packages ruby-packages dev-packages

system-packages:
	sudo dnf install gnome-extensions-app gnome-shell-extension-appindicator \
	perk-FindBin wl-clipboard

base-packages:
	sudo dnf install -y  htop git tmux curl man zip unzip jq keychain \
		ripgrep neofetch rsync bash-completion fzf wget fd-find go httpie bat

ruby-packages:
	sudo dnf install -y autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel \
	libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel

dev-packages:
	sudo dnf install -y ImageMagick-devel postgresql-devel mariadb-devel shared-mime-info libwebp

asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0


