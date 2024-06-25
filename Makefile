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

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

font:
	brew tap homebrew/cask-fonts
	brew install --cask font-iosevka-nerd-font

packages: base-packages ruby-packages dev-packages

base-packages:
	brew install htop tmux zip unzip jq ripgrep rsync fzf wget asdf \
		lf lazygit fd sad git-delta httpie bat zsh-completion

ruby-packages:
	brew install openssl@3 readline libyaml gmp

dev-packages:
	# brew install --cask docker
	brew install --cask dbeaver-community
	brew install imagemagick postgresql mariadb shared-mime-info

asdf:
	asdf plugin-add ruby
	asdf plugin-add nodejs
	asdf install ruby 3.1.4
	asdf global ruby 3.1.4
	asdf install nodejs 20.12.2
	asdf global nodejs 20.12.2
