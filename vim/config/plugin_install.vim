" Minimalist Vim Plugin Manager
" Specify a directory for plugins (~/.vim/plugged) 
call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""
" Language plugins

" NERD powerful comments
Plug 'scrooloose/nerdcommenter'

" Polyglot for syntax support on several languages
Plug 'sheerun/vim-polyglot'

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
" Needs LUA support on VIM!! I don't have it
" Plug 'jeaye/color_coded'

" Colorschemes
" Apprentice theme
Plug 'romainl/Apprentice'

" Lucario theme
"Plug 'raphamorim/lucario'

" Lucius theme
Plug 'jonathanfilip/vim-lucius'

" Tender theme
Plug 'jacoborus/tender'

" Ayu theme
Plug 'ayu-theme/ayu-vim'

" Vim-colors-pencil theme
Plug 'reedes/vim-colors-pencil'

" Indent lines
" Plug 'Yggdroot/indentLine'

"""""""""""""""""""""""""
" Integration plugins

" vimtex - a modern LaTeX plugin
Plug 'lervag/vimtex'

" Markdown preview on browser
Plug 'JamshedVesuna/vim-markdown-preview'

"""""""""""""""""""""""""
" Interface plugins

" Vim windows layouts
" :VwmOpen <layout_name>
" :VwmClose <layout_name>
" :VwmToggle <layout_name>
Plug 'paroxayte/vwm.vim'

" Tree file system explorer
" Plug 'christoomey/vim-tmux-navigator'

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
" Plug 'wellle/visual-split.vim'

" Unimpaired
" Pairs of handy bracket mappings
" https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
Plug 'tpope/vim-unimpaired'

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

call plug#end()

