all: config-base
config-base:
	ln -snf $(PWD)/.config/htop ~/.config/htop
	ln -sf $(PWD)/.zshrc ~/.zshrc
	ln -sf $(PWD)/.vimrc ~/.vimrc

config-i3:
	ln -snf $(PWD)/Backgrounds ~/Backgrounds
	ln -snf $(PWD)/.config/i3 ~/.config/i3
	ln -snf $(PWD)/.config/picom ~/.config/picom
	ln -snf $(PWD)/.config/polybar ~/.config/polybar
	ln -snf $(PWD)/.config/alacritty ~/.config/alacritty
	ln -snf $(PWD)/.config/rofi ~/.config/rofi
	ln -snf $(PWD)/.config/ranger ~/.config/ranger

arch-base:
	sudo pacman --needed -S htop git curl zsh lazygit go rust  man base-devel libffi libyaml openssl zlib postgresql-libs mariadb-libs imagemagick zip unzip ranger jq

arch-i3:
	sudo pacman --needed -S udiskie udisks2 firefox gnome-keyring otf-font-awesome ttc-iosevka keychain feh alacritty rofi picom polybar maim xclip xdotool ttf-nerd-fonts-symbols ttf-jetbrains-mono ttf-jetbrains-mono-nerd

arch-laptop:
	sudo pacman --needed -S tlp acpid brightnessctl thermald

wsl-base:
	sudo apt install htop git curl zsh autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev imagemagick libmariadb-dev libpq-dev libmagickwand-dev

deps: deps-gem deps-npm deps-go

deps-go:
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install golang.org/x/tools/gopls@latest
	go install -tags 'clickhouse' github.com/xo/usql@latest
deps-gem:
	gem install solargraph

deps-npm:
	npm install -g typescript typescript-language-server vscode-langservers-extracted

systemd:
	systemctl enable tlp
	systemctl enable acpid
	systemctl enable thermald

git:
	git config --global core.editor "vim"
	git config --global user.name "Danil Antoshin"
	git config --global user.email antoshindanil@ya.ru
	git config --global pull.rebase false

git-change-remote:
	git remote set-url origin git@github.com:antoshindanil/dotfiles.git

ohmyzsh:
	sh -c "$$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2
	~/.asdf/bin/asdf plugin-add ruby
	~/.asdf/bin/asdf plugin-add nodejs

asdf-install:
	~/.asdf/bin/asdf install ruby 3.1.2
	~/.asdf/bin/asdf install nodejs 14.21.3
	~/.asdf/bin/asdf global ruby 3.1.2
	~/.asdf/bin/asdf global nodejs 14.21.3

yay:
	git clone https://aur.archlinux.org/yay.git ~/yay
	cd ~/yay; makepkg -si
	rm -rf ~/yay

printer:
	yay -S pantum-driver gscan2pdf ghostscript

flatpak-install:
	flatpak install flathub com.github.tchx84.Flatseal org.telegram.desktop com.google.Chrome org.telegram.desktop io.dbeaver.DBeaverCommunity org.libreoffice.LibreOffice de.shorsh.discord-screenaudio
