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

ubuntu-packages: ubuntu-base-packages ubuntu-ruby-packages ubuntu-dev-packages

ubuntu-base-packages:
	sudo apt install -y  htop git tmux curl man zip unzip jq keychain \
		ripgrep neofetch rsync bash-completion fzf wget fd-find httpie bat

ubuntu-ruby-packages:
	sudo apt install -y autoconf patch build-essential rustc libssl-dev \
		libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev \
		libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

ubuntu-dev-packages:
	sudo apt install -y libmagickwand-dev imagemagick postgresql-client-common \
		libpq-dev libmariadbd-dev shared-mime-info webp

fedora-packages: fedora-base-packages fedora-ruby-packages fedora-dev-packages

fedora-system-packages:
	sudo dnf install gnome-extensions-app gnome-shell-extension-appindicator \
	perk-FindBin wl-clipboard

fedora-base-packages:
	sudo dnf install -y  htop git tmux curl man zip unzip jq keychain \
		ripgrep neofetch rsync bash-completion fzf wget fd-find go httpie bat

fedora-ruby-packages:
	sudo dnf install -y autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel \
	libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel

fedora-dev-packages:
	sudo dnf install -y ImageMagick-devel postgresql-devel mariadb-devel shared-mime-info libwebp

asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0


