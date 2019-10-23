" This is my configuration file for vim. I adapted it to be used
" as a tutorial based on different websites. It includes:
"  - Basic commands to understand and use vim efficientely
"  - Basic buffer and window splits manipulations (to be done)
"  - Miscellaneous maps and commands (to be done)
"  - Plugins description and details (to be done)
"
"  The sections are followed by the respective configuration and
"  specific commands. For plugins, the commands are near the 
"  plugin configurations.
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
" - Visual : text selection <v>, block selection <c-v> or line selection <V>
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
" f<char> : move cursor to next ocurrence of <char> charactere
" F<char> : move cursor to previous ocurrence of <char> charactere
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
" ## editing text efficiently ( and remain in normal mode)
" J  : join line below and keep one space in between
" gJ : join line below and no space in between
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
" ## miscellaneous (normal mode)
" :!<command> : use terminal commands inside vim
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

