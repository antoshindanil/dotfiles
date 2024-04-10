all:
	mkdir -p ~/.config
	make base
	make git
	make nvim

base: base-config

base-config:
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

packages:
	sudo apt install git htop tmux curl man zip unzip keychain rsync bash-completion wget

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/danil/.bashrc

brew-packages:
	brew install lf lazygit fd sad git-delta jq ripgrep fzf httpie bat rbenv go nvm

brew-dev-packages:
	brew install imagemagick postgresql mariadb shared-mime-info webp

