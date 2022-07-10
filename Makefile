install: \
	prepare_dirs \
	install_brew \
	install_pips \
	install_vim \
	install_ohmyzsh \
	link \

link:
	ln -f tmux/tmux.conf ~/.tmux.conf
	ln -f git/gitmessage ~/.gitmessage
	ln -f git/gitconfig ~/.gitconfig
	ln -f theme ~/.theme

prepare_dirs:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/fish
	mkdir -p ~/.config/fish/completions
	mkdir -p ~/.ipython/profile_default
	mkdir -p ~/Library/KeyBindings
	mkdir -p ~/.config/karabiner/

install_brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew tap Homebrew/bundle
	brew bundle

install_pips:
	pip3 install -r Pipfile

install_vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +qall
	nvim +UpdateRemotePlugins +qall

install_ohmyzsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

install_vim_min:
	wget https://raw.githubusercontent.com/livioso/vim-sensible/master/plugin/sensible.vim
	mv sensible.vim ~/.vimrc
