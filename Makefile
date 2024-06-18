all:
	mkdir -p ~/.config
	make base
	make git
	make asdf

base:
	ln -sf $(PWD)/.bashrc ~/.bashrc
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -snf $(PWD)/config/helix ~/.config/
	ln -snf $(PWD)/config/htop ~/.config/
	ln -snf $(PWD)/config/nvim ~/.config/

git:
	git remote set-url origin git@github.com:antoshindanil/dotfiles.git

packages: copr-packages base-packages ruby-packages dev-packages

copr-packages:
	sudo dnf copr enable atim/lazygit
	sudo dnf copr enable pennbauman/ports

system-packages:
	sudo dnf install gnome-extensions-app gnome-shell-extension-appindicator \
	perk-FindBin wl-clipboard

base-packages:
	sudo dnf install -y  htop git tmux curl man zip unzip \
		jq keychain ripgrep neofetch rsync bash-completion fzf wget \
		lf lazygit fd-find sad git-delta go httpie bat helix

ruby-packages:
	sudo dnf install -y autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel \
	libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel

dev-packages:
	sudo dnf install -y ImageMagick-devel postgresql-devel mariadb-devel shared-mime-info libwebp

lsp-packages:
	sudo dnf install -y yaml-language-server bash-language-server typescript-language-server \
		marksman ansible-language-server taplo-cli vscode-json-languageserver
	npm i -g "awk-language-server@>=0.5.2" sql-language-server
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install golang.org/x/tools/cmd/goimports@latest
	go install golang.org/x/tools/gopls@latest

asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0


