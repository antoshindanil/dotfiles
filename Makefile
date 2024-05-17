jall:
	mkdir -p ~/.config
	make base
	make git
	make packages
	make asdf

base:
	ln -sf $(PWD)/.zshrc ~/.zshrc
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -snf $(PWD)/config/helix ~/.config/
	ln -snf $(PWD)/config/htop ~/.config/

git:
	git remote set-url origin git@github.com:antoshindanil/dotfiles.git

nvim:
	rm -rf nvim/plugin || exit 0
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0
	ln -snf $(PWD)/config/nvim ~/.config/nvim

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

packages: base-packages ruby-packages dev-packages

base-packages:
	brew install htop tmux zip unzip jq ripgrep rsync fzf wget asdf \
		lf lazygit fd sad git-delta go nodejs npm yarn httpie bat docker \
		zsh-completion

ruby-packages:
	brew install openssl@3 readline libyaml gmp

dev-packages:
	brew install --cask docker
	brew install --cask dbeaver-community
	brew install imagemagick postgresql mariadb shared-mime-info

lsp-packages:
	sudo pacman -S --needed yaml-language-server bash-language-server typescript-language-server \
		gopls marksman ansible-language-server taplo-cli vscode-json-languageserver \
		vscode-html-languageserver vscode-css-languageserver vue-language-server
	npm i -g "awk-language-server@>=0.5.2" sql-language-server
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install golang.org/x/tools/cmd/goimports@latest

asdf:
	asdf plugin-add ruby
	asdf plugin-add nodejs
	asdf install ruby 3.1.4
	asdf global ruby 3.1.4
	asdf install nodejs 20.12.2
	asdf global nodejs 20.12.2
