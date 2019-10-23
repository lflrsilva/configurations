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

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Polyglot disabled for latex due to incompabilities
" with vimtex package
let g:polyglot_disabled = ['latex']

"""""""""""""""""""""""""
" Completion configuration plugins

"""""""""""""""""
" You Complete Me 
" Compatible with UltiSnips 
let g:ycm_autoclose_preview_window_after_completion = 1

" commands for Gnu/Linux or Windows
let g:ycm_key_list_select_completion = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']

" commands for MacOS
" if has("mac") || has("macunix")
"     let g:ycm_key_list_select_completion = ['<D-j>']
"     let g:ycm_key_list_previous_completion = ['<D-k>']
" endif

" Python configuration
let g:ycm_python_interpreter_path = '/usr/local/bin/python3'

"""""""""""""""""
" Ultisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"

" commands for Gnu/Linux or Windows
let g:UltiSnipsJumpForwardTrigger = "<c-m>"
let g:UltiSnipsJumpBackwardTrigger = "<c-n>"

" commands for MacOS
" if has("mac") || has("macunix")
"     let g:UltiSnipsJumpForwardTrigger = "<D-]>"
"     let g:UltiSnipsJumpBackwardTrigger = "<D-[>"
" endif

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""
" Code display configuration plugins
" The following syntax and number commands are set here only
" due to some restrictions on plugins declared above

" Enable syntax highlighting
syntax enable

" Show line number
set number

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Define colorscheme
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu
" colorscheme lucius
" colorscheme tender
"set background=dark

" Visual Mode Orange Background, Black Text
" guifg = selection color, guibg = cursor color on Hex colors
" #000000 = black, #DFAF00 = orange
highlight Visual  guifg=#000000 guibg=#DFAF00

" Default Colors for CursorLine on normal mode
" #3E3D32 = gray-blueish, #A6E22E = green
highlight CursorLine guibg=#323D3E
highlight Cursor guibg=#A6E22E;

" Change Color when entering Insert Mode
" #323D3E = gray-greenish, #00AAFF = blue
autocmd InsertEnter * highlight  CursorLine guibg=#323E32
autocmd InsertEnter * highlight  Cursor guibg=#00AAFF;

" Revert Color to default when leaving Insert Mode
" return to normal mode
autocmd InsertLeave * highlight  CursorLine guibg=#323D3E
autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;

" Delimiter column color
highlight ColorColumn guibg=#005f00 guifg=#A1CCB0


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

" Markdown preview options
let vim_markdown_preview_toggle=2

"""""""""""""""""""""""""
" Interface configuration plugins

"""""""""""""""""
" NERDTree 
" NERDTree activation
" autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<cr>

" close NERDTree if it is the last window active
autocmd bufenter * 
\    if (winnr("$") == 1  &&
\        exists("b:NERDTree") &&
\        b:NERDTree.isTabTree())
\        | q |
\    endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py',  'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('jl',  'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('C',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('c',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('cpp', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('H',   'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('h',   'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('hpp', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('txt', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('csv', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('tex', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('md', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('cmake', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('xcodeproj', 'Magenta', 'none', '#ff00ff', '#151515')

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
let g:airline_theme='ayu_mirage'
" let g:airline_theme='tender'
let macvim_skip_colorscheme=1
" let g:airline_theme='jellybeans'
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

