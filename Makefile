# $(CURDIR) will give the path to directory in which Makefile is present
link:
	ln -s $(CURDIR)/.vimrc ~/.vimrc
	ln -s $(CURDIR)/.tmux.conf ~/.byobu/.tmux.conf
	ln -s $(CURDIR)/.latexmkrc ~/.latexmkrc
	ln -s $(CURDIR)/init.vim ~/.config/nvim/init.vim
	ln -s $(CURDIR)/zathurarc ~/.config/zathura/zathurarc
force:
	ln -sf $(CURDIR)/.vimrc ~/.vimrc
	ln -sf $(CURDIR)/.tmux.conf ~/.byobu/.tmux.conf
	ln -sf $(CURDIR)/.latexmkrc ~/.latexmkrc
	ln -sf $(CURDIR)/init.vim ~/.config/nvim/init.vim
	ln -sf $(CURDIR)/zathurarc ~/.config/zathura/zathurarc

install:
	apt install git
	apt install neovim
	apt install byobu
