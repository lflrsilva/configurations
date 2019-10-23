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
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" terminal color
" set term=screen-256color

" highlight current line
set cursorline

" column delimiter position
set colorcolumn=80


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
" set lbr
" set tw=79

set autoindent  " Auto indent
set smartindent " Smart indent
set wrap        " Wrap lines
set tw=80       " Line break limit
set fo+=t       " Linebreak on tw

set autowrite   " Automatically save before commands like :next and :make


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" # Visual mode, buffers and windows efficiently
"
" ## visual mode (from normal mode)
" v     : enter visual mode and <esc> to return to normal mode
" V     : select line
" <c-v> : select block
" 
" LF's tip on block visual selections.
" - For block edition, <c-v> to activate block selection and use h,j,k,l
"   to select text. <I> and insert the text as it will show it only on
"   the first line. When finished, press <esc>. Harry Potter feelings.
" - On the following CSS code, select the 3 internal lines and type
"   :sort to order alphabetically
"
" h4 {
"   font-size: 11px;
"   margin: 15px;
"   background: red;
" }
"
" - On the following C code, the ; is missing. Select both lines and
"   write :normal A; (append at the end of line and insert ;)
"
" int i;
" double var, ff;
"
" ## buffers
" Buffers must be seen as window tabs for files related to the same
" project. On default, the files are shown sequentially and can be
" accessed through commands.
" :e file : open file on new buffer
" :ls : list open buffers
" :bn : go to the next buffer
" :bp : go to the previous buffer
" :bd : delete buffer (close file)
"
" ## windows splits
" Windows can be spiltted to show different buffers as the user may
" access and work on each one.
" :sp file  : open file on a new buffer with horizontal split
" :vsp file : open file on a new buffer with vertical split
" 
" ## change window buffers
" Each buffer window can be accessed using the commands:
" <c-w>l : go to window on right
" <c-w>h : go to window on left
" <c-w>j : go to window below
" <c-w>k : go to window above
" <c-w>q : close active split
" <c-w><c-w> : cycle through buffers on splits
"
" ## change size of splitted window
" <c-w>+ : to increase the size of an horizontal split
" <c-w>- : to decrease the size of an horizontal split
" <c-w>> : to increase the size of a vertical split
" <c-w>< : to decrease the size of a vertical split
" <c-w>_ : to increase to maximum height
" <c-w>| : to increase to maximum width
" <c-w>= : to set the same size for all buffers
" <c-w>10+ : increases a 10 line space on the buffer
"
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" To deactivate selection, see disable highlight below
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSelection('gv')<CR>

" When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

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
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grep search command: /<pattern>/<options>/ <file>
" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" Open a new buffer for quickfix (errors on current file) on bottom
" When you search with vimgrep, display your results in cope by doing:
map <leader>cv :botright cope<cr>

" Open quickfix for current file as new tab
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" To go to the next search result do:
map <leader>n :cn<cr>

" To go to the previous search results do:
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
