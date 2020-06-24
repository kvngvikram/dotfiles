# $(CURDIR) will give the path to directory in which Makefile is present
link:
	ln -s $(CURDIR)/.bashrc ~/.bashrc
	ln -s $(CURDIR)/.vimrc ~/.vimrc
	ln -s $(CURDIR)/.tmux.conf ~/.byobu/.tmux.conf
	ln -s $(CURDIR)/.latexmkrc ~/.latexmkrc
	ln -s $(CURDIR)/init.vim ~/.config/nvim/init.vim
	ln -s $(CURDIR)/zathurarc ~/.config/zathura/zathurarc
force:
	ln -sf $(CURDIR)/.bashrc ~/.bashrc
	ln -sf $(CURDIR)/.vimrc ~/.vimrc
	ln -sf $(CURDIR)/.tmux.conf ~/.byobu/.tmux.conf
	ln -sf $(CURDIR)/.latexmkrc ~/.latexmkrc
	ln -sf $(CURDIR)/init.vim ~/.config/nvim/init.vim
	ln -sf $(CURDIR)/zathurarc ~/.config/zathura/zathurarc

terminal_install:
	apt install -y git
	apt install -y neovim
	apt install -y byobu
	apt install -y fonts-powerline
	apt install -y ranger

gui_install:
	apt install -y zathura
	apt install -y redshift-gtk
	apt install -y safeeyes
	apt install -y indicator-multiload
	apt install -y gparted

browser:
	apt install -y browser-plugin-freshplayer-pepperflash

latex:
	apt install -y texlive-latex-extra
	apt install -y biber
	apt install -y latexmk

hotspot:
	apt install -y hostapd
	git clone "https://github.com/oblique/create_ap.git" --depth=1
	make install -C create_ap
	rm -rf create_ap
	
# for openacc with gfortran
# apt install nvidia-cuda-toolkit
# apt install gcc-offload-nvptx

# For virtual second display based on vnc check the following
# https://github.com/mrenrich84/vnc_virtual_display_linker
# https://github.com/kbumsik/VirtScreen
