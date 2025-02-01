# $(CURDIR) will give the path to directory in which Makefile is present
default:
	echo possible options are: link, force, opt_folders, binaries, appimages, fonts, terminal_install, gui_install, latex, miscellaneous
link:
	ln -s $(CURDIR)/home_dots/.bashrc ~/.bashrc
	ln -s $(CURDIR)/home_dots/.condarc ~/.condarc
	ln -s $(CURDIR)/home_dots/.latexmkrc ~/.latexmkrc
	ln -s $(CURDIR)/home_dots/.profile ~/.profile

	ln -s $(CURDIR)/home_dots/.tmux.conf ~/.tmux.conf

	mkdir -p ~/.local/share
	mkdir -p ~/Pictures/icons

	ln -s $(CURDIR)/dot_local_share/nvim/ ~/.local/share/nvim
	ln -s $(CURDIR)/dot_local_share/blesh/ ~/.local/share/blesh
	ln -s $(CURDIR)/dot_local_share/applications/ ~/.local/share/applications
	ln -s $(CURDIR)/misc/Pictures_icons/ ~/Pictures/icons

	mkdir -p ~/.config

	ln -s $(CURDIR)/dot_config/nvim/       ~/.config/nvim
	ln -s $(CURDIR)/dot_config/fish/       ~/.config/fish
	ln -s $(CURDIR)/dot_config/zathura/    ~/.config/zathura
	ln -s $(CURDIR)/dot_config/lf/         ~/.config/lf
	ln -s $(CURDIR)/dot_config/lazygit/    ~/.config/lazygit
	ln -s $(CURDIR)/dot_config/pip/        ~/.config/pip
	ln -s $(CURDIR)/dot_config/kitty/      ~/.config/kitty
	ln -s $(CURDIR)/dot_config/fzf/        ~/.config/fzf
	ln -s $(CURDIR)/dot_config/pycodestyle ~/.config/pycodestyle

	mkdir -p ~/.ipython/profile_default/startup
	ln -s $(CURDIR)/dot_ipython_profile_default_startup/  ~/.ipython/profile_default/startup

	mkdir -p ~/installs_and_builds
	$(CURDIR)/misc/Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/installs_and_builds/miniconda3

force:
	ln -sf $(CURDIR)/home_dots/.bashrc ~/.bashrc
	ln -sf $(CURDIR)/home_dots/.condarc ~/.condarc
	ln -sf $(CURDIR)/home_dots/.latexmkrc ~/.latexmkrc
	ln -sf $(CURDIR)/home_dots/.profile ~/.profile

	ln -sf $(CURDIR)/home_dots/.tmux.conf ~/.tmux.conf

	mkdir -p ~/.local/share

	rm -rf ~/.local/share/nvim   2> /dev/null  && ln -sf $(CURDIR)/dot_local_share/nvim/ ~/.local/share/nvim
	rm -rf ~/.local/share/blesh  2> /dev/null  && ln -sf $(CURDIR)/dot_local_share/blesh/ ~/.local/share/blesh
	rm -rf ~/.local/share/applications  2> /dev/null  && ln -sf $(CURDIR)/dot_local_share/applications/ ~/.local/share/applications
	rm -rf ~/Pictures/icons 2> /dev/null && mkdir -p ~/Pictures && ln -sf $(CURDIR)/misc/Pictures_icons/ ~/Pictures/icons

	mkdir -p ~/.config

	rm -rf ~/.config/nvim    2> /dev/null  && ln -sf $(CURDIR)/dot_config/nvim/       ~/.config/nvim
	rm -rf ~/.config/fish    2> /dev/null  && ln -sf $(CURDIR)/dot_config/fish/       ~/.config/fish
	rm -rf ~/.config/zathura 2> /dev/null  && ln -sf $(CURDIR)/dot_config/zathura/    ~/.config/zathura
	rm -rf ~/.config/lf      2> /dev/null  && ln -sf $(CURDIR)/dot_config/lf/         ~/.config/lf
	rm -rf ~/.config/lazygit 2> /dev/null  && ln -sf $(CURDIR)/dot_config/lazygit/    ~/.config/lazygit
	rm -rf ~/.config/pip     2> /dev/null  && ln -sf $(CURDIR)/dot_config/pip/        ~/.config/pip
	rm -rf ~/.config/kitty   2> /dev/null  && ln -sf $(CURDIR)/dot_config/kitty/      ~/.config/kitty
	rm -rf ~/.config/fzf     2> /dev/null  && ln -sf $(CURDIR)/dot_config/fzf/        ~/.config/fzf
	ln -sf $(CURDIR)/dot_config/pycodestyle ~/.config/pycodestyle

	mkdir -p ~/.ipython/profile_default/startup
	rm -rf ~/.ipython/profile_default/startup  2> /dev/null && ln -sf $(CURDIR)/dot_ipython_profile_default_startup/  ~/.ipython/profile_default/startup
	
	mkdir -p ~/installs_and_builds
	$(CURDIR)/misc/Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/installs_and_builds/miniconda3
	
binaries:
	mkdir -p ~/bin
	cp $(CURDIR)/bin/* ~/bin/
	ln -sf ~/bin/nvim-linux-x86_64.appimage ~/bin/vim
	ln -sf ~/bin/nvim-linux-x86_64.appimage ~/bin/nvim
	ln -sf ~/bin/tmux.appimage ~/bin/tmux
	echo make links for other AppImages using appimages option

appimages:
	wget http://10.61.43.103/appimages/wine-stable_8.0.1-x86_64.AppImage -P /tmp
	cp /tmp/wine-stable_8.0.1-x86_64.AppImage ~/bin
	chmod +x ~/bin/wine-stable_8.0.1-x86_64.AppImage
	ln -sf ~/bin/wine-stable_8.0.1-x86_64.AppImage ~/bin/wine

fonts:
	wget http://10.61.43.103/fonts/MS_fonts_from_thinclient.zip -P /tmp
	wget http://10.61.43.103/fonts/nerd-fonts-master.zip -P /tmp

	mkdir -p ~/.local/share/fonts
	unzip /tmp/MS_fonts_from_thinclient.zip -d ~/.local/share/fonts
	unzip /tmp/nerd-fonts-master.zip -d ~/.local/share/fonts

	rm /tmp/nerd-fonts-master.zip /tmp/MS_fonts_from_thinclient.zip

terminal_install:
	apt install -y kitty git fonts-powerline htop ripgrep fish default-jdk pandoc bat chafa unzip 7zip unrar catdoc docx2txt odt2txt gnumeric exiftool libcdio-utils
	apt install -y libxcb-xinerama0  # required for matplotlib=qt from a pyenv created with miniconda python
	apt install -y expect

gui_install:
	apt install -y zathura redshift-gtk safeeyes indicator-multiload gparted thunderbird
	apt install onlyoffice-desktopeditors ttf-mscorefonts-installer-
	echo installed onlyoffice without Microsoft fonts !!
	echo configure those fonts seperately, by using the option: fonts

aegis:
	~/installs_and_builds/miniconda3/bin/python3 -m venv ~/installs_and_builds/python_venv/aegis
	~/installs_and_builds/python_venv/aegis/bin/pip install -r $(CURDIR)/misc/Aegis-decrypt-master/requirements.txt


latex:
	apt install -y texlive-latex-extra texlive-bibtex-extra biber latexmk
