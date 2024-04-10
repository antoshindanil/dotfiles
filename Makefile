all:
	mkdir -p ~/.config
	make base
	make git
	make nvim
	make packages
	make locale
	make docker
	make asdf

base:
	ln -sf $(PWD)/.bashrc ~/.bashrc
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -snf $(PWD)/config/htop ~/.config/

git:
	git remote set-url origin git@github.com:antoshindanil/dotfiles.git

nvim:
	rm -rf nvim/plugin || exit 0
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0
	ln -snf $(PWD)/config/nvim ~/.config/nvim

locale:
	sudo /bin/bash -c "echo 'ru_RU.UTF-8 UTF-8' > /etc/locale.gen"
	sudo /bin/bash -c "echo 'LANG=ru_RU.UTF-8' > /etc/locale.conf"
	sudo locale-gen

docker:
	sudo systemctl start docker.socket
	sudo systemctl enable docker.socket
	sudo usermod -aG docker $(USER)

packages: base-packages ruby-packages dev-packages lsp-packages

base-packages:
	sudo pacman -S --needed base-devel htop git tmux curl man zip unzip \
		jq keychain ripgrep neofetch rsync bash-completion fzf wget \
		lf lazygit fd sad git-delta go nodejs npm yarn httpie bat docker

ruby-packages:
	sudo pacman -S --needed base-devel rust libffi libyaml openssl zlib

dev-packages:
	sudo pacman -S --needed imagemagick postgresql-libs mariadb-libs shared-mime-info libwebp

lsp-packages:
	sudo pacman -S --needed yaml-language-server bash-language-server typescript-language-server \
		gopls marksman ansible-language-server taplo-cli vscode-json-languageserver \
		vscode-html-languageserver vscode-css-languageserver vue-language-server
	# sudo npm i -g "awk-language-server@>=0.5.2" sql-language-server
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install golang.org/x/tools/cmd/goimports@latest

yay:
	git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay && makepkg -si && rm -rf ~/yay

asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0


