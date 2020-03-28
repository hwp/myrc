" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
"          Weipeng He <heweipeng>
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
" Customized: for Weipeng He

"------------------------------------------------------------
" Features
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
" set ignorecase
" set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
" set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


"------------------------------------------------------------
" Indentation options
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
set tabstop=2


"------------------------------------------------------------
" Mappings
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------
" Added by Weipeng He
"

" Maps
inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>

nnoremap <SPACE><SPACE> :w<CR>
nnoremap <SPACE>q :q<CR>
nnoremap <SPACE>n :cn<CR>
nnoremap <SPACE>p :cp<CR>
nnoremap <SPACE>T :NERDTreeToggle<CR>
nnoremap <SPACE>ga :Gwrite<CR>
nnoremap <SPACE>gd :Gdiff<CR>
nnoremap <SPACE>gs :Gstatus<CR>
nnoremap <SPACE>gc :Gcommit<CR>
nnoremap <SPACE>gb :Gblame<CR>
nnoremap <SPACE>gl :Git lola<CR>
nnoremap <SPACE>gp :grep '\b<cword>\b' -r .<CR>

" copy whole text
function! XClip()
  execute '!xclip -se c %'
endfunction

nnoremap <SPACE>c :call XClip()<CR><SPACE>:echo 'File copied'<CR>

" window navigation
nnoremap <SPACE>j <C-W>j
nnoremap <SPACE>k <C-W>k
nnoremap <SPACE>h <C-W>h
nnoremap <SPACE>l <C-W>l
nnoremap <SPACE>J <C-W>J
nnoremap <SPACE>K <C-W>K
nnoremap <SPACE>H <C-W>H
nnoremap <SPACE>L <C-W>L

" window split
nnoremap <SPACE>sv :vsplit<CR>
nnoremap <SPACE>sh :split<CR>

" tabs manipulation
nnoremap <SPACE>t :tabnew<CR>
nnoremap <SPACE>1 :tabnext 1<CR>
nnoremap <SPACE>2 :tabnext 2<CR>
nnoremap <SPACE>3 :tabnext 3<CR>
nnoremap <SPACE>4 :tabnext 4<CR>
nnoremap <SPACE>5 :tabnext 5<CR>
nnoremap <SPACE>6 :tabnext 6<CR>
nnoremap <SPACE>7 :tabnext 7<CR>
nnoremap <SPACE>8 :tabnext 8<CR>
nnoremap <SPACE>9 :tabnext 9<CR>
nnoremap <SPACE>0 :tabnext 10<CR>

" Delete trailing spaces
nnoremap <LEADER>d :%s/\s\{1,\}$//<CR>

" start spell check
nnoremap <LEADER>sp :set spell spelllang=en_us<CR>
nnoremap <SPACE>s ]s

" replace word under cursor
nnoremap <SPACE>rr :s/\<<C-r><C-w>\>/
nnoremap <SPACE>ra :%s/\<<C-r><C-w>\>/

" diable Q (ex mode)
nnoremap Q <nop>

" show linewrap
set showbreak=↪

" automatic set to paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" for Pathogen
execute pathogen#infect()

" close nerdtree automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" include path for header files
set path+=/usr/local/include

" no preview window for completion
set completeopt-=preview

" airline configuration
function! AirlineInit()
  let g:airline_section_b = airline#section#create(['branch'])
endfunction
autocmd VimEnter * call AirlineInit()

let g:airline_powerline_fonts=1

" syntastic configuration
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes', 'flake8']

" auto format
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:formatters_python = ['yapf', 'autopep8', 'black']
nnoremap <LEADER>f :Autoformat<CR>

" templates
let g:file_template_default = {}
let g:file_template_default['py'] = 'python_header'
let g:file_template_default['tex'] = 'tex_article'
nnoremap <LEADER>h :LoadFileTemplate<CR>


"------------------------------------------------------------
" For vimsuite
"
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'

