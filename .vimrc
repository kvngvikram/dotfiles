" Things to note: 
"
" If you are using NeoVim instead of Vim then do as following to just use this
" .vimrc script for NeoVim as well.
" Links: 
" https://vi.stackexchange.com/a/15548
" https://neovim.io/doc/user/nvim.html#nvim-from-vim
"
" Reserved Registers:
" z - temporary register
" r - is used for General_Vimux_mapping
"
" Reserved marks:
" z - temporary mark
" i - <Leader>i mapping to insert at last edited location
"
" This configuration assumes that vim is running inside a tmux session (while
" writing this, byobu is used instead of tmux).
" 
" There are mappings to directly open this file in new tab.
" 'kj' is mapped to escape and save the file.
"
" <Enter> or <CR> key is used in mappings assuming that it is not of much use
" in normal and visual mode. For the rest of the mappings a Leader key is used
" which can be changed. 


"""""""""""""""""""""""""""""   vim-plug   """""""""""""""""""""""""""""
" refer: https://github.com/junegunn/vim-plug
" vim-plug auto install if not installed 
if empty(glob('~/.vim/autoload/plug.vim'))
	
	" !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	
	" for vim
	!wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
	" for neovim
	"!wget -P ~/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

	call plug#begin()    " This line not found in the github (presently when writing this)
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



"""""""""""""""""""""""""""""    plugins   """""""""""""""""""""""""""""
" For new plugins add them to the list
call plug#begin('~/.vim/plugged')

"Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/ajh17/VimCompletesMe'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'benmills/vimux'
"Plug 'jupyter-vim/jupyter-vim' 		" refer : https://github.com/jupyter-vim/jupyter-vim
"Plug 'julienr/vim-cellmode'
"Plug 'ivanov/vim-ipython'

Plug 'jpalardy/vim-slime'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Install this: https://github.com/powerline/fonts

Plug 'vim-scripts/SyntaxRange'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" for python install : pip install python-language-server
" for NeoVim install : pip install pynvim

" For browser only for Neovim above 0.4
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" For indent guides/lines
Plug 'Yggdroot/indentLine'

" A game :
Plug 'vim/killersheep'

Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jceb/vim-orgmode'

Plug 'lervag/vimtex'

Plug 'rhysd/vim-grammarous'

" Plug 'wellle/context.vim'

" VS Code like color scheme
Plug 'tomasiser/vim-code-dark'

call plug#end()
" To install new plugins enter this command once vim in opened 
" :PlugInstal


"""""""""""""""""""""""""""""   general    """""""""""""""""""""""""""""
"let mapleader = ","
let mapleader = "\<Space>"

" This is to have a bash like autocomplete
"set completeopt=menu,longest
" set completeopt+=menu,longest

""""""""""""""""""""""""""""" YCM
"let g:ycm_autoclose_preview_window_after_insertion = 1

""""""""""""""""""""""""""""" vim-lsp, asynccomplete
"" For colors check the colors-section
let g:lsp_semantic_enabled = 0
let g:lsp_preview_float = 1  " details of aurguments in a floating popup
let g:lsp_diagnostics_enabled = 1   " Checking the code for errors
let g:lsp_diagnostics_echo_cursor = 1  " Display error below at :command line
let g:lsp_signs_enabled = 1   " Signs on the left of line numbers
let g:lsp_textprop_enabled = 0  " highlighting of parts of code with problems
let g:lsp_highlights_enabled = 0   " only for neovim 0.3+
let g:lsp_virtual_text_enabled = 0 " only for neovim 0.3+ additional text next to problems
let g:asyncomplete_auto_popup = 1
let g:lsp_highlight_references_enabled = 1
" let g:lsp_preview_float = 1
function! s:check_back_space() abort
	    let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Check for the mappings section where <Esc> action in insert mode is mapped

""""""""""""""""""""""""""""" cellmode
let g:cellmode_default_mappings='0'

""""""""""""""""""""""""""""" slime
let g:slime_no_mappings = 1
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.tmp_vim-slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"} " check github page for this
let g:slime_dont_ask_default = 1

""""""""""""""""""""""""""""" jupyter-vim
let g:jupyter_mapkeys='0'

""""""""""""""""""""""""""""" NERDTree-tabs
nnoremap <Leader>t :NERDTreeTabsToggle<CR>

""""""""""""""""""""""""""""" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <M-h> :TmuxNavigateLeft<cr>
nnoremap <M-j> :TmuxNavigateDown<cr>
nnoremap <M-k> :TmuxNavigateUp<cr>
nnoremap <M-l> :TmuxNavigateRight<cr>


""""""""""""""""""""""""""""" SyntaxRange
" For python in .sh scripts
autocmd BufReadPost,BufNewFile *.sh, :call SyntaxRange#Include('#python_begin','#python_end','python','NonText')

""""""""""""""""""""""""""""" vim-airline
"" For colors check the colors-section
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""" indentLine
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 1

""""""""""""""""""""""""""""" vimtex
" let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_quickfix_enabled = 0
let g:tex_flavor="latex"

"" dictionary path
"set dictionary+=/usr/share/dict/british-english

set nu rnu
set cursorline
set ruler

" always show statusline
set laststatus=1
"set statusline=\ %F\ »\ %h%m%r\ %y%=\ %n\ »\ %-10.(%l,%c%V%)\ →\ %P

"set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab
 
let fortran_free_source=1
let fortran_do_enddo=1
filetype plugin on 
"filetype plugin indent on 
"set autoindent
"set smartindent

" Echo commands as they are being entered
set showcmd

syntax on
set background=dark
"color slate

" Disable beeping
set noerrorbells
" flash the screen for bell
"set visualbell 

" while searching jump to match
set incsearch
set hlsearch

" change the current working directory whenever you open a file, switch,delete buffer or open/close a window
set autochdir

" completion in command mode for vim (defalut enabled in neovim)
set wildmenu

" Remember foldings
autocmd BufLeave,BufWinLeave * silent! mkview
autocmd BufReadPost * silent! loadview
" Give first line of fold as fold name
"set foldtext=getline(v:foldstart)
set foldtext=foldtext()

" use default system clipboard for copy-pasting
" this will enable copy paste to and from vim using d, y and p
set clipboard=unnamedplus

" set mouse support on
" features: visual select, cursor position, scrolling
set mouse=a

" color column
set colorcolumn=80

"""""""""""""""""""""""""""""colors-section"""""""""""""""""""""""""""""
colorscheme codedark
let g:airline_theme='codedark'  " This is airline support from plugin vim-code-dark
highlight ColorColumn ctermbg=236
highlight CursorLine ctermbg=236
highlight Search ctermbg=DarkYellow ctermfg=White
highlight LineNr ctermfg=Yellow
highlight MatchParen ctermbg=Blue ctermfg=LightYellow
highlight SpellBad ctermbg=red
highlight SpellCap ctermbg=DarkBlue
highlight SpellLocal ctermbg=DarkBlue
highlight SpellRare ctermbg=DarkBlue
highlight Pmenu ctermbg=239 ctermfg=white
highlight PmenuSel ctermfg=white
highlight Folded ctermbg=17 ctermfg=159
" ctermbg=DarkBlue
" highlight LineNr ctermfg=LightYellow ctermbg=DarkBlue
" highlight LspWarningHighlight ctermbg=brown
"highlight link LspErrorHighlight Error
"highlight link LspWarningHighlight hl-Ignore
"highlight lspReference ctermfg=lightyellow ctermbg=darkgrey
highlight lspReference ctermfg=LightYellow ctermbg=239

"""""""""""""""""""""""""""""   mappings   """""""""""""""""""""""""""""
" mapping Esc key in insert mode and also save the file and just Esc in
" Also mark the location with 'i'
inoremap kj <Esc>:w<CR>mi

" With closing the preview split
inoremap kj <Esc>:w<CR>mi:pclose<CR>
" Without closing the preview split
inoremap KJ <Esc>:w<CR>mi

" Insert at the last inserted position
nnoremap <Leader>i `ia

vnoremap <Leader><Leader> <Esc><Esc>
nnoremap <Leader><Leader> <Esc>:w<CR><Esc>
" mapping , to showing .vimrc file in normal mode 
nnoremap <Leader>, :tabnew ~/.vimrc<ENTER>

" Map j,k so that it will move DOWN,UP line by line for long wrapped lines.
" Also Mapping for navigation using relative numbers when lines are wrapped
" Refer: https://vi.stackexchange.com/a/16944
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'

" General_Vimux_mapping
" nnoremap <Leader>r :call VimuxRunCommand(@r)<CR>
nnoremap <Leader>r :!<C-r>r<CR><CR>

" for warpping lines
nnoremap <Leader>w :set wrap!<CR>

" Visual search
vnoremap // "zy/\V<C-R>=escape(@z,'/\')<CR><CR>
" for '\V' refer :help /\V

" removing search highlights
nnoremap <Leader>/ :noh<CR>

" Toggle spell check 
nnoremap <Leader>sp :set spell!<CR>
" Toggle syntax coloring
nnoremap <Leader>sn :if exists("g:syntax_on") <Bar>
			\	syntax off <Bar>
			\else <Bar>
			\	syntax on <Bar>
			\endif <CR><CR>

" backspace in insert mode doesn't work sometimes if this is not done.
set backspace=indent,eol,start         " from: https://vi.stackexchange.com/a/2163

" change split sizes
nnoremap <C-h> <C-w><
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-l> <C-w>>



"""""""""""""""""""""""""""""   tex_file   """""""""""""""""""""""""""""

let g:tex_conceal=""
function! Tex_file_commands()
	" inoremap <Leader>q <Esc>:w<CR><Esc>:!pdflatex %<CR><CR>
	" nnoremap <Leader>q <Esc>:w<CR><Esc>:!pdflatex %<CR><CR>:!pdflatex %<CR><CR>
	" nnoremap <Leader>r <Esc>:w<CR><Esc>:call VimuxRunCommand("pdflatex ".@%." && bibtex ".@%[0:-5].".aux && pdflatex ".@%." && pdflatex ".@%." && exit")<CR><CR>
	
	" To show the exact text in math mode instead of shoing greek letters
	" let g:tex_conceal=""
	
	" No colorcolumn for .tex files
	set colorcolumn=0

	" Avoind breaking of words at the end of line wrapping 
	set linebreak

	nnoremap <CR> z=1<ENTER><ENTER> 
	" Donn't mark URL-like things as spelling errors
	syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
	" Don't count acronyms / abbreviations as spelling errors
	" (all upper-case letters, at least three characters)
	" Also will not count acronym with 's' at the end a spelling error
	" Also will not count numbers that are part of this
	" Recognizes the following as correct:
	syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
	" Jump to next and previous misspelled words
	nnoremap <Leader>n ]s
	nnoremap <Leader>N [s

	" Grammer check
	nmap <Leader>g :GrammarousCheck<CR>
	nnoremap <Leader>G :GrammarousReset<CR>
endfunction
autocmd BufReadPost,BufNewFile *.tex, call Tex_file_commands()

"""""""""""""""""""""""""""""  text_file   """""""""""""""""""""""""""""
function! Text_file_commands()
	set linebreak
	set spell
	" replace a word with the first suggestion from dictionary
	nnoremap <CR> z=1<ENTER><ENTER> 
	" Lines from
	" http://www.panozzaj.com/blog/2016/03/21/ignore-urls-and-acroynms-while-spell-checking-vim/
	" Donn't mark URL-like things as spelling errors
	syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
	" Don't count acronyms / abbreviations as spelling errors
	" (all upper-case letters, at least three characters)
	" Also will not count acronym with 's' at the end a spelling error
	" Also will not count numbers that are part of this
	" Recognizes the following as correct:
	syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
	" Jump to next and previous misspelled words
	nnoremap <Leader>n ]s
	nnoremap <Leader>p [s
endfunction
" execute the following for some particular files
autocmd BufReadPost,BufNewFile *.txt, call Text_file_commands()

"""""""""""""""""""""""""""""   py_file    """""""""""""""""""""""""""""
function! Python_file_commands()
	" The following is for ease of writing py2nb compactable codes.
	nmap <Leader>o o#<Space>\|<Space>
	nmap <Leader>O O#<Space>\|<Space>
endfunction
" execute the following for some particular files
autocmd BufReadPost,BufNewFile *.py, call Python_file_commands()


"""""""""""""""""""""""""""""    Vimux     """""""""""""""""""""""""""""
" Function that can be called for Vimux
function! Vimux_commands()
	let g:VimuxOrientation = "h" 	" Open a new tmux pane to the right
	let g:VimuxHeight = "40"	" This is percentage

	nnoremap <Leader>^ :call VimuxOpenRunner()<CR>:call VimuxRunCommand("cd ".getcwd())<CR>
	nnoremap <CR> mz0v$h"zy:call VimuxRunCommand(@z)<CR><Esc>`z
	vnoremap <CR> "zy:call VimuxRunCommand(@z)<CR>
	nmap <Leader>i <Esc>:VimuxInterruptRunner<CR>
endfunction


"""""""""""""""""""""""""""""   SlimeTmux  """""""""""""""""""""""""""""
function! Slime_Tmux_commands()
	" check github page for this
	let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}

	nnoremap <Leader>^ :!tmux split-window -d -h -p 40<CR><CR>
				\:execute 'SlimeSend1 cd ' getcwd()<CR>
				\:SlimeSend1 clear<CR>
	" Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR> 
	" But I don't know how to send an <Enter>

	nmap <CR> V<Plug>SlimeRegionSend
	xmap <CR> <Plug>SlimeRegionSend
	nnoremap <Leader>& :SlimeSend1 clear<CR>
endfunction

"autocmd BufReadPost,BufNewFile *.sh, call Vimux_commands()
autocmd BufReadPost,BufNewFile *.sh, call Slime_Tmux_commands()

""""""""""""""""""""""""""""" Jupyter-vim  """""""""""""""""""""""""""""
function! Jupyter_vim_qtconsole_commands()
	" open jupiter qtconsole and connect to it. Note: no spaces before \
	" qtconsole can be opened with configurations, refer ~/.jupyter/jupyter_qtconsole_config.py
	nnoremap <Leader>^ :!jupyter qtconsole --JupyterWidget.syntax_style="paraiso-dark" --JupyterWidget.font_size=12&<ENTER>
				\:sleep 500m <ENTER>
				\:JupyterConnect<ENTER>
	nmap <CR> V<Plug>JupyterRunVisual
	vmap <CR> <Plug>JupyterRunVisual
	nmap <Leader>& oclear<Esc>V<Plug>JupyterRunVisualddk:w<CR>
	nmap <Leader>qt o%matplotlib<Space>qt<Esc>V<Plug>JupyterRunVisualddk:w<CR>
	nmap <Leader>q :JupyterRunFile<CR>
endfunction


""""""""""""""""""""""""""""" JPy_console  """""""""""""""""""""""""""""
"" Note : this needs both jupyter-vim/jupyter-vim, julienr/vim-cellmode and benmills/vimux
function! Jupyter_vim_console_commands()
	let g:VimuxOrientation = "h" 	" Open a new tmux pane to the right
	let g:VimuxHeight = "40"	" This is percentage

	" open jupiter console and connect to it. Note: no spaces before \
	nnoremap <Leader>^ :call VimuxRunCommand("cd ".getcwd())<CR>
				\:call VimuxRunCommand("jupyter console")<CR>
				\:call VimuxRunCommand("%matplotlib qt")<CR>
				\:sleep 500m<CR>
				\:JupyterConnect<CR>

	"nmap <CR> mzV:JupyterSendRange<CR>:sleep 20m<CR>:call VimuxSendKeys("Enter")<CR>`z
	nnoremap <CR> mz0v$h"zy:call VimuxSendText(@z)<CR>:call VimuxSendKeys("M-Enter")<CR><Esc>`z
	"nmap <CR> V<Plug>JupyterRunVisual:call VimuxSendKeys("Enter")<CR>
	"vmap <Leader><CR> <Plug>JupyterRunVisual:sleep 20m<CR>:call VimuxSendKeys("Enter")<CR>
	vmap <Leader><CR> <Plug>JupyterRunVisual
	vnoremap <CR> "zy:call VimuxSendText(@z)<CR>:call VimuxSendKeys("M-Enter")<CR>
	"vnoremap <CR> "zy:call VimuxSendText(@z)<CR>:call VimuxSendKeys("Enter")<CR>
	"vnoremap <CR> "zy:call VimuxRunCommand(@z)<CR>

	"" Here the Vimux command is not used along with jupyter-vim, because if the time taken to run the cell is high then additional Vimux <Enter> with raise a warning. And if that happens then in ipython each time to enter a line (manually), <Enter> should be pressed 3 times (or Alt+Enter or Ctrl+o should be used).
	"nmap <Leader><CR> mzVgg:JupyterSendRange<CR>`z
	""nmap <Leader>q :JupyterRunFile<CR>
	"nmap <Leader>r :call VimuxRunCommand("%run -i ".getcwd()."/".@%)<CR>:call VimuxSendKeys("C-o")<CR>
	
	" cellmode
	let g:cellmode_default_mappings='0' 	" disable the default mappings
	let g:cellmode_tmux_panenumber='1'

	nnoremap <Leader>r mzggVG:call RunTmuxPythonChunk()<CR>:call VimuxSendKeys("M-Enter")<CR>`z
	nnoremap <Leader><CR> mzVgg:call RunTmuxPythonChunk()<CR>:call VimuxSendKeys("M-Enter")<CR>`zzz
	
	"nmap <Leader>qt o%matplotlib<Space>qt<Esc>V<Plug>JupyterRunVisualddk:w<CR>:call VimuxSendKeys("Enter")<CR>
	nmap <Leader>qt :call VimuxRunCommand("%matplotlib qt")
	nnoremap <Leader>& :call VimuxSendText("clear")<CR>:call VimuxSendKeys("M-Enter")<CR>

endfunction


""""""""""""""""""""""""""""" vim-cellmode """""""""""""""""""""""""""""
let g:cellmode_default_mappings='0' 	" disable the default mappings
let g:cellmode_tmux_panenumber='1'
function! Cellmode_commands()
	vmap <CR> :call RunTmuxPythonChunk()<CR>
	nmap <CR> 0v$h:call RunTmuxPythonChunk()<CR>
endfunction


""""""""""""""""""""""""""""" SlimeVimuxPy """""""""""""""""""""""""""""
function! Slime_Vimux_Py_commands()
	let g:VimuxOrientation = "h" 	" Open a new tmux pane to the right
	let g:VimuxHeight = "40"	" This is percentage
	
	" check github page for this
	let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}

	nnoremap <Leader>^ :call VimuxRunCommand("cd ".getcwd())<CR>
				\:call VimuxRunCommand("ipython")<CR>
				\:call VimuxRunCommand("%matplotlib qt")<CR>
	nmap <CR> V<Plug>SlimeRegionSend
	xmap <CR> <Plug>SlimeRegionSend
	nmap <Leader><CR> mzVgg<Plug>SlimeRegionSend`zzz
	nmap <Leader>r mzggVG<Plug>SlimeRegionSend`zzz
	nnoremap <Leader>& :SlimeSend1 clear<CR>
endfunction


""""""""""""""""""""""""""""" SlimeTmuxPy  """""""""""""""""""""""""""""
function! Slime_Tmux_Py_commands()
	
	" check github page for this
	let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
	let g:slime_python_ipython = 1

	nnoremap <Leader>^ :!tmux split-window -d -h -p 40 'ipython --matplotlib=qt'<CR><CR>
				\:execute 'SlimeSend1 cd ' getcwd()<CR>
				\:SlimeSend1 clear<CR>
	" Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR> 
	" But I don't know how to send an <Enter>

	nmap <CR> V<Plug>SlimeRegionSend
	xmap <CR> <Plug>SlimeRegionSend
	nmap <Leader><CR> mzVgg<Plug>SlimeRegionSend`zzz
	nmap <Leader>r mzggVG<Plug>SlimeRegionSend`zzz
	nnoremap <Leader>& :SlimeSend1 clear<CR>
endfunction

autocmd BufReadPost,BufNewFile *.py, call Slime_Tmux_Py_commands()
"autocmd BufReadPost,BufNewFile *.py, call Slime_Vimux_Py_commands()
"autocmd BufReadPost,BufNewFile *.py, call Cellmode_commands()
"autocmd BufReadPost,BufNewFile *.py, call Vimux_commands()
"autocmd BufReadPost,BufNewFile *.py, call Jupyter_vim_qtconsole_commands()
"autocmd BufReadPost,BufNewFile *.py, call Jupyter_vim_console_commands()


"""""""""""""" Notes for python
" qtconsole was discarded because there was an auto scrolling problem then, so
" it had to be cleared regularly. Also it is not inside the terminal.
"
" only vimux was discarded because it has problem with indents. Eg. an if
" condition with few lines in it cannot be sent (with visual) because there
" will be errors due to indents.
"
" Vimux actually suggests to use vim-cellmode to solve the above problems with
" vimux. But cellmode will always have a line in the beginning of every text
" packet like %load from a /tmpfile. Cellmode saves what ever is supponsed to
" be sent to a tmp file and use vimux to send a command saying just load that
" tmpfile. Fine for larger texts but annoying if the text sent is small like
" one line or just a variable name. 
"
" So to solve this vimux and cellmode can be used together. For one liners and
" variable names use vimux and for whole file or large part of file use
" cellmode. But there is a small annoyence with small chunks of codes with
" indents Eg. small if conditions etc. Yet this is a really good setup. 
"
" But the wishes never ends....
"
" Another setup is to use jupyter-vim inside console. This has another
" problem, it doesn't display the changes in the ipython console unless
" someone presses enter in ipython pane. So,, use vimux to send an enter key
" after text is sent by jupyter-vim. Now there is no problem with indents and
" no annoying %load /tempfile lines. And vimux works just fine for one linesrs
" and variable names so use vimux for that. 
" Another issue. If the text sent by jupyter-vim takes longer time to execute
" and vimux sends an enter key before the code execution is finished then
" ipython turns to 'not received is_complete_request mode'. Now ipython will
" always be expecting indents for the following lines. Even for just a
" variable name it expects three enter strokes for three lines expecting if
" condition like indented lines.
" A delay can be added before vimux sends enter but delay that is required
" varies. 
" So, use cellmode again. Use cellmode, vimux setup but for small chunks with
" indents use jupyter-vim. Now all problems seems to be solved. Just this 
" is a bit complicated.
"
" And there comes vim-slime. I found it in reddit. I will work exactly same as
" just vimux for one liners and variable names. And when There is an indent
" block or multiple lines it will take care of that by using %cpaste. So looks
" similar to cellmode but smaller and adds the extra % or magic lines only
" when necessary. Overall slime takes lesser space in ipython.
" But there is a problem. Yeah this never ends :).
" Slime cannot open a new pane/split like vimux. So to open that split I am
" using vimux in the beginning.
" Hey, do you know tmux can be controlled by tmux commands? tmux split-window
" exists. So now I am using :!tmux split-window to open new split instead of 
" Vimux. So, I think we have reached to a good state, where things can be done
" just by one plugin!
"
" One thing to note is I have to use jupyter console or jupyter qtconsole only
" when jupyter-vim is involved. jupyter-vim basically connects to a jupyter
" kernel/server (donno). Just ipython doesn't involve such kernel/server.
" Also jupyter console/qtconsole doesn't have %cpaste so slime may not work
" with jupyter (qt)console.
