all:
	mkdir -p ~/.config
	make base
	make git
	make git-change-remote

base: base-config

base-config:
	ln -sf $(PWD)/.bashrc ~/.bashrc
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -snf $(PWD)/.config/helix ~/.config/
	ln -snf $(PWD)/.config/htop ~/.config/

flatpak: flatpak-add flatpak-install

flatpak-add:
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak-install:
	flatpak install -y flathub org.telegram.desktop io.dbeaver.DBeaverCommunity

arch-packages:
	sudo pacman -S --needed base-devel htop git tmux curl man zip unzip \
		jq keychain ripgrep neofetch rsync bash-completion fzf wget rustup \
		lf lazygit fd sad git-delta
	sudo pacman -S --needed libffi libyaml openssl zlib imagemagick postgresql-libs mariadb-libs

git:
	git config --global core.editor "helix"
	git config --global user.name "Danil Antoshin"
	git config --global user.email antoshindanil@ya.ru
	git config --global pull.rebase true

git-change-remote:
	git remote set-url origin git@github.com:antoshindanil/dotfiles.git

asdf: asdf-install

asdf-install:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

asdf-setup:
	asdf plugin-add ruby

asdf-inst:
	asdf install ruby 3.0.1
	asdf install ruby 3.1.2

lsp-install:
	npm i -g "awk-language-server@>=0.5.2" bash-language-server vscode-langservers-extracted typescript typescript-language-server sql-language-server yaml-language-server@next
	go install golang.org/x/tools/gopls@latest
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install golang.org/x/tools/cmd/goimports@latest
	gem install --user-install solargraph
	rustup component add rust-analyzer
	cargo install taplo-cli --locked --features lsp
