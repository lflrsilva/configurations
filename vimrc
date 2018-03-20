"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM configuration with Mac OS support
"
" Author  : lflrsilva
" Date    : Nov, 25th, 2017
" Updates : Mar, 20th, 2018
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" # How to use vim efficiently
" There are 4 steps to master vim:
" 1. Survive
" 2. Fell confortable
" 3. Fell better, stronger, faster
" 4. Use vim superpowers
"
" ## understand vim modes
" - Normal : command insertion with keys or key combinations
" - Visual : text selection <v>, block selection <c-v> or line selection <s-v>
" - Insert : text insertion after a specific command
"
" LF's recommendation: Stay out of insert mode! Vim true power is unleashed
" on normal mode. Always use <esc> to return to normal mode.
"
" ## key combination for commands
" <s-...>      : shift key
" <c-...>      : control key
" <a-...>      : alt key
" <m-...>      : alt key
" <d-...>      : command key (Mac only)
" <leader-...> : leader is a customisable key
"
" Other keys are possible
" <F1> to <F12>           : function keys
" <cr>, <enter>, <return> : Return key
" <space>                 : space key
" <esc>                   : esc key
"
" ## moving efficiently on text (normal mode)
" h,j,k,l : represents the arrow keys. It does not mean you can't use the arrow
"           keys. Your hand is closer to other commands if you use the
"           suggested keys.
" w  : move cursor word by word
" e  : move cursor word end by word end
" b  : move backwards cursor word by word
" 0  : move cursor to beginning of current line 
" ^  : move cursor to first character of current line
" $  : move cursor to end of current line
" )  : move cursor forward to next sentence
" (  : move cursor backward to next sentence
" }  : move cursor forward to next paragraph or block
" {  : move cursor backward to next paragraph or block
"
" ## moving efficiently on file (normal mode)
" <c-f> : move the cursor forward by a screenful of text
" <c-b> : move the cursor backward by a screenful of text
" G     : move the cursor to the end of the file
" numG  : move the cursor line number num
" gg    : move the cursor to the beginning of the file
" H     : move the cursor to the top of the screen
" M     : move the cursor to the middle of the screen
" L     : move the cursor to the bottom of the screen
" *     : read the string under the cursor and go to the next place it appears
" #     : same as above, except it moves the cursor to the previous occurance
" /text : starting from the cursor, find the next occurance of the string text
"         and go to it. You will need to press Enter to execute the search.
"         To re-execute your last search, type n (for next occurance) or N
"         (for previous occurance)
" ?text : same as /, but searches in the opposite direction
" ma    : make a bookmark named a at the current cursor position. A bookmark
"         can be named any lowercase letter. You can't see the bookmark, but
"         it's there!
" `a    : go to bookmark a. Important: that's a backtick, not a single quote
"
" ## editing text efficiently (entering insert mode)
" i : insert text to the left of the current character.
" I : insert text at the beginning of the current line.
" a : insert text to the right of the current character.
" A	: insert text at the end of the current line.
" o : create a new line under the current one and insert text there.
" O : create a new line above the current one and insert text there.
"
" ## deleting/substituting text efficiently 
" c<command> : delete text moved by <command> and enter insert mode
" d<command> : delete text moved by <command>
" x          : delete forward character over cursor
" X          : delete backward character over cursor
" s          : substitute text over cursor and enter insert mode
" S          : substitute line over cursor and enter insert mode
"
" Important : when deleting/substituting, the text element is automatically
"             yanked (copied). Thus, you can paste it later.
"
" ## copy/paste efficiently
" p          : paste after cursor
" P          : paste before cursor
" yy         : yank (copy) line
" yw         : yank (copy) word
" y)         : yank (copy) until end of sentence
" y<command> : yank (copy) text moved by <command>
"
" ## undo/redo
" u     : undo last command
" <c-r> : redo last command
" 
" ## autocompletion options (insert mode)
" <c-n>/<c-p> : complete with registered words
" <c-x> <c-l> : complete with registered line
" :set dictionary=/directory_for_dic
" <c-x> <c-k> : dictionary completion
" 
" ## saving and open files
" :w          : write (save) current open file
" :w filename : write (save) current open file with filename name
" :e filename : open file with filename name
"
" Ps.: you can go through directories to find specific files. in addition,
"      autocompletion with <tab> is possible.
"
" ## quiting vim
" :q  : quit vim (does not save file!)
" :q! : quit vim imediatetly (does not save file!)
" ZZ  : quit vim imediatetly and save file
"
" # References
" http://robertames.com/files/vim-editing.html
" http://www.radford.edu/~mhtay/CPSC120/VIM_Editor_Commands.htm
" https://www.keycdn.com/blog/vim-commands/
" http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
"
" # Motivational references
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
" http://www.websiterepairguy.com/articles/vi/12_learn_vi.html
" https://csswizardry.com/2014/06/vim-for-people-who-think-things-like-vim-are-weird-and-hard/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Starting VIM configuration
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check OS
function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

let os=GetRunningOS()

" Sets how many lines of history VIM has to remember
set history=700

" Force iMproved
set nocompatible

" Disable filetype plugins for YCM (will be activated later)
filetype off 

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc,*.so,*.dylib

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" search
set incsearch           " incremental search mode
set hlsearch            " highlight search things
set ignorecase          " ignore case when searching
set smartcase           " only works when ignorecase on

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight current line
set cursorline

" column delimiter position
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencodings=utf-8,latin-1

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Coding
set number       " show line number
set showmatch    " show matching brackets.
set matchtime=2  " the length of time to show matching brackets.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4    " The number of spaces when auto-indent.
set tabstop=4       " The number of spaces count for a TAB
set softtabstop=4   " The number of spaces inserted when typing TAB.
                    " If not expandtab, type TAB twice, will get one TAB.

" Linebreak on 500 characters
set lbr
set tw=79
set fo=

set autoindent  " Auto indent
set smartindent " Smart indent
set wrap        " Wrap lines

set autowrite   " Automatically save before commands like :next and :make


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSelection('gv')<CR>

" When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Surround the visual selection in parenthesis/brackets/etc.:
" vnoremap $( <esc>`>a)<esc>`<i(<esc>
" vnoremap $[ <esc>`>a]<esc>`<i[<esc>
" vnoremap ${ <esc>`>a}<esc>`<i{<esc>
" vnoremap $" <esc>`>a"<esc>`<i"<esc><esc>
" vnoremap $' <esc>`>a'<esc>`<i'<esc><esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows (buffers) 
"map <C-j> <C-W>j
"map <C-h> <C-W>h
"map <C-k> <C-W>k
"map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to last non-blank character
map 0 $
" Remap VIM 9 to first non-blank character
map 9 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" normal mode
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
" visual mode
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cv
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cv :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" search next/previous spell
map <leader>sn ]s
map <leader>sp [s
" include spell
map <leader>sa zg
" show spell suggestions
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins installation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minimalist Vim Plugin Manager
" Specify a directory for plugins (~/.vim/plugged) 
call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""
" Language plugins

" NERD powerful comments
Plug 'scrooloose/nerdcommenter'


"""""""""""""""""""""""""
" Completion plugins

" Autocomplete closing elements as (), [] etc
Plug 'raimondi/delimitmate'

" Snippets package
Plug 'SirVer/ultisnips'

" Snippets collections
Plug 'honza/vim-snippets'

" YouCompleteMe code completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" YCM generator
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

"""""""""""""""""""""""""
" Code display plugins

" color-coded real time code highlight for C-family languages
" Plug 'jeaye/color_coded'

" Colorschemes
" Apprentice theme
Plug 'romainl/Apprentice'

" Lucario theme
Plug 'raphamorim/lucario'

" Lucius theme
Plug 'jonathanfilip/vim-lucius'

" Tender theme
Plug 'jacoborus/tender'

" Vim-colors-pencil theme
Plug 'reedes/vim-colors-pencil'

"""""""""""""""""""""""""
" Integration plugins

" vimtex - a modern LaTeX plugin
Plug 'lervag/vimtex'

"""""""""""""""""""""""""
" Interface plugins

" Tree file system explorer
Plug 'scrooloose/nerdtree'

" Fuzzy file, buffer, tag etc finder
Plug 'ctrlpvim/ctrlp.vim'

" Smooth scroll
Plug 'yuttie/comfortable-motion.vim'

" vim-bookmarks
" mm - add/remove toggle bokmark
" mi - add/edit/remove annotation
" mn - next bookmark
" mp - previous bookmark
" ma - show all bookmarks
" mc - clear bookmarks in current buffer
" mx - clear bookmarks in all buffers
Plug 'mattesgroeger/vim-bookmarks'

" Visual split windows
" resize split to visual selection (:VSResize)
" split out visual selection (:VSSplit)
" split out visual selection above (:VSSplitAbove)
" split out visual selection below (:VSSplitBelow)
Plug 'wellle/visual-split.vim'

" Fancy start screen
Plug 'mhinz/vim-startify'

" Status/tabline for vim and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"""""""""""""""""""""""""
" Command plugins

" Easymotion - Vim motions on speed
" <leader><leader>w - go to beginning of word
" <leader><leader>b - go backwards to beginning of word 
" <leader><leader>e - go to end of word 
" <leader><leader>ge - go backwards to end of word 
" <leader><leader>f(F) - go to character (backwards)
" <leader><leader>k - go to line
Plug 'easymotion/vim-easymotion'

" Git wrapper
"Plug 'tpope/vim-fugitive'

" Supertab plugin
"Plug 'ervandew/supertab'

" Syntax checking for progamming
"Plug 'vim-syntastic/syntastic', { 'on': 'syntasticToggle'}

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""
" Language configuration plugins

"""""""""""""""""""""""""
" NERD Commenter package
" Most used commands
" [count]<leader>cc - comment line or visual selection
" [count]<leader>c<space> - toggle comment or uncomment
" [count]<leader>cu - uncomment line or visual selection
" [count]<leader>cy - comment but yank first 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""
" Completion configuration plugins

"""""""""""""""""
" You Complete Me 
" Compatible with UltiSnips 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']

"""""""""""""""""
" Ultisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-m>"
let g:UltiSnipsJumpBackwardTrigger = "<c-n>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""
" Code display configuration plugins

" Enable syntax highlighting
syntax enable

" Show line number
set number

" Define colorscheme
colorscheme apprentice 
"colorscheme lucius
"colorscheme tender
"set background=dark

"""""""""""""""""""""""""
" Integration configuration plugins

" Vimtex
" General usage <localleader> = \
" <localleader>li  |<plug>(vimtex-info)|                           `n`
" <localleader>lt  |<plug>(vimtex-toc-open)|                       `n`
" <localleader>lT  |<plug>(vimtex-toc-toggle)|                     `n`
" <localleader>ly  |<plug>(vimtex-labels-open)|                    `n`
" <localleader>lY  |<plug>(vimtex-labels-toggle)|                  `n`
" <localleader>lv  |<plug>(vimtex-view)|                           `n`
" <localleader>ll  |<plug>(vimtex-compile)|                        `n`
" <localleader>lk  |<plug>(vimtex-stop)|                           `n`
" <localleader>lK  |<plug>(vimtex-stop-all)|                       `n`
" <localleader>le  |<plug>(vimtex-errors)|                         `n`
" <localleader>lo  |<plug>(vimtex-compile-output)|                 `n`
" <localleader>lg  |<plug>(vimtex-status)|                         `n`
" <localleader>lc  |<plug>(vimtex-clean)|                          `n`
" <localleader>lC  |<plug>(vimtex-clean-full)|                     `n`
" <localleader>lm  |<plug>(vimtex-imaps-list)|                     `n`
" <localleader>ls  |<plug>(vimtex-toggle-main)|                    `n`
" dse              |<plug>(vimtex-env-delete)|                     `n`
" dsc              |<plug>(vimtex-cmd-delete)|                     `n`
" ds$              |<plug>(vimtex-env-delete-math)|                `n`
" dsd              |<plug>(vimtex-delim-delete)|                   `n`
" cse              |<plug>(vimtex-env-change)|                     `n`
" csc              |<plug>(vimtex-cmd-change)|                     `n`
" cs$              |<plug>(vimtex-env-change-math)|                `n`
" csd              |<plug>(vimtex-delim-change-math)|              `n`
" tsc              |<plug>(vimtex-cmd-toggle-star)|                `n`
" tse              |<plug>(vimtex-env-toggle-star)|                `n`
" tsd              |<plug>(vimtex-delim-toggle-modifier)|          `nx`
" tsD              |<plug>(vimtex-delim-toggle-modifier-reverse)|  `nx`
" <F7>             |<plug>(vimtex-cmd-create)|                     `nxi`
" ]]               |<plug>(vimtex-delim-close)|                    `i`
" ac               |<plug>(vimtex-ac)|                             `xo`
" ic               |<plug>(vimtex-ic)|                             `xo`
" ad               |<plug>(vimtex-ad)|                             `xo`
" id               |<plug>(vimtex-id)|                             `xo`
" ae               |<plug>(vimtex-ae)|                             `xo`
" ie               |<plug>(vimtex-ie)|                             `xo`
" a$               |<plug>(vimtex-a$)|                             `xo`
" i$               |<plug>(vimtex-i$)|                             `xo`
" aP               |<plug>(vimtex-aP)|                             `xo`
" iP               |<plug>(vimtex-iP)|                             `xo`
" %                |<plug>(vimtex-%)|                              `nxo`
" ]]               |<plug>(vimtex-]])|                             `nxo`
" ][               |<plug>(vimtex-][)|                             `nxo`
" []               |<plug>(vimtex-[])|                             `nxo`
" [[               |<plug>(vimtex-[[)|                             `nxo`
let g:vimtex_compiler_latexmk = {
\ 'options' : [
\   '-pdf',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ]
\}

" Defining PDF viewer
let g:vimtex_view_method='skim'

" Using YCM for completion
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Explicity latex filetype for new *.tex files
let g:tex_flavor = "latex"

"""""""""""""""""""""""""
" Interface configuration plugins

"""""""""""""""""
" NERDTree 
" NERDTree activation
map <F2> :NERDTreeToggle<cr>

" close NERDTree if it is the last window active
autocmd bufenter * 
\    if (winnr("$") == 1  &&
\        exists("b:NERDTree") &&
\        b:NERDTree.isTabTree())
\        | q |
\    endif

"""""""""""""""""
" CtrlP finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"""""""""""""""""
" Airline theme plugin
" airline theme
let g:airline_theme='jellybeans'
" let g:airline_theme_bg='dark'

" allow upper line for buffers
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""
" Commands configuration plugins

"""""""""""""""""""""""""
" Other configuration plugins

"let g:SuperTabDefaultCompletionType = '<C-n>'


" Syntastic syntax checker
" disable syntastic on the statusline
"let g:statline_syntastic = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Color scheme from plugins
"let g:lucius_style = 'dark'
"let g:lucius_contrast = 'high'

" Enable filetype plugins for YCM
"filetype plugin on
"filetype indent on

" TagList and Ctags
" Specify ctags executable
"let $Tlist_Ctags_Cmd='/opt/local/bin/ctags'

" Activate TagList
"nnoremap <silent> <F8> :TlistToggle<CR>

" Activate omni completion
" filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" Shortcut for SuperTab completion
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" SuperTab decides completion mode
"let g:SuperTabDefaultCompletionType = "context"
" Complete options (disable preview scratch window)
" set completeopt = menuone,longest
" Limit popup menu height
" set pumheight=15
" inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End of plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
