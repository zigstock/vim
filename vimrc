" vim config file ~/.vimrc
" Fergus Bremner <fergus.bremner@gmail.com>
" Last Modified: 2014-01-08 09:05:15 EST

" Section: Settings {{{1
"---------------------------------------------------------------------------"
set nocompatible            " Use Vim settings (must be first)

set autochdir               " Auto-change cwd to current file
set autoread                " Auto read a file when it's changed from without
set autowrite               " Auto write file when switching to another file or window
set cursorline
set enc=utf-8               " Default encoding to UTF-8
set fenc=utf-8              " ditto
set fileformat=unix         " Set fileformat to UNIX
set fileformats=unix,mac    " Fave filetypes
set history=1000            " VIM history
set lazyredraw              " Do not redraw, when running macros
set matchpairs+=<:>         " Bounce between matches
set noerrorbells            " Turn off error warnings
set nostartofline           " Keep the cursor in the current column with page commands
set novisualbell
set number                  " Show line numbers
set printfont=monospace:h9
set ruler                   " Always show current position
set scrolljump=2
set scrolloff=3             " show lines on vertcal scroll
set secure                  " Disable security risk features
set shell=zsh               " Set shell to zsh
set shortmess+=filmnrxoOtT  " abbr of messages (avoids 'hit enter'))"
set showbreak=↪ 
set showtabline=1
set splitbelow              " New pane put below the current one
set switchbuf=usetab
set t_vb=                   " Disable error beeps
set viminfo=%,'20,<50,h     " Restore cursor position between sessions
set whichwrap=b,s,h,l,<,>,[,] " keys wrap to previous/next line

" Section: Swap and backup {{{1
"---------------------------------------------------------------------------"

set nobackup                  " No backups
set nowritebackup             " No atomic saves
set undofile
set undolevels=100  " maximum number of changes that can be undone
set undoreload=100  " maximum number lines to save for undo on a buffer reload
set directory=$HOME/.vim/tmp//,.,/tmp//  " swp files to /tmp if neccesary
set undodir=$HOME/.vim/undo//
set viewdir=$HOME/.vim/view//

" Create directories if they don't exist
silent execute '!mkdir -p $HOME/.vim/tmp > /dev/null 2>&1'
silent execute '!mkdir -p $HOME/.vim/undo > /dev/null 2>&1'
silent execute '!mkdir -p $HOME/.vim/view > /dev/null 2>&1'

" Section: Search {{{1
"---------------------------------------------------------------------------"

set incsearch               " Show the `best match so far' as search strings are typed
set magic                   " Magic on
set mat=2
set nohls                   " Don't highlight search
set showmatch
set smartcase
"set wrapscan                " begin search at top when EOF reached

" Section: Syntax {{{1
"---------------------------------------------------------------------------"

syntax enable                " syntax highlighting
set synmaxcol=1024           " switch off for wide documents
set t_Co=256                 " force 256color
set modeline
set modelines=5
color acedia

" Section: GUI {{{1
"---------------------------------------------------------------------------"

if has("gui_running")

  if has("gui_gtk2") " GTK/Linux font
    set guifont=Screen\ 9
    set columns=79
    set lines=55
  elseif has('gui_macvim')
    set guifont=Monaco:h10  " Mac font
    set noantialias
    set columns=90
    set lines=55
    set transp=0 " transparency
    set fuopt+=maxhorz " full width full screen
  else
    set guifont=monospace:h9
    set columns=79
    set lines=55
  endif

  "set guicursor=a:blinkon0
  set guicursor=n-v-c:blinkon0

  " Hide menus and toolbar
  set guioptions-=m
  set guioptions-=T

  "Hide scrollbars
  set guioptions-=L
  set guioptions-=l
  set guioptions-=R
  set guioptions-=r
  set guioptions-=b

  set guioptions+=a " copy selection to register

  if has("mouse")
    set mousehide   " Hide mouse when typing
    "set mousemodel=popup_setpos
    set mousemodel=extend
  endif
else
  set nuw=3
  set ttimeoutlen=10
  if has("autocmd")
" escape insert mode immediately
    augroup FastEscape
      autocmd!
      autocmd InsertEnter * set timeoutlen=0
      autocmd InsertLeave * set timeoutlen=1000
    augroup END
  endif
endif

" Nice window title
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%{v:progname} " program name
  set titlestring+=\ \|\ %f\ " file name
  set titlestring+=%h%m%r%w " flags
  "set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " cwd
endif

" Section: Status-line {{{1
"---------------------------------------------------------------------------"

" Format statusline
set laststatus=2
set statusline=
set statusline+=%<[%n]\           " buffer number
set statusline+=%Y\ 
"set statusline+=[%{&encoding},    " encoding
"set statusline+=%{&fileformat}]   " file format
set statusline+=\ %F%m%r%h\        " filename and path
set statusline+=%w                 " flags
if &ft != 'mail'
  set statusline+=%{fugitive#statusline()} " git
endif
set statusline+=%=                 " right align
set statusline+=%P\ 
set statusline+=Ln:%l/%L\ 
set statusline+=Col:%c%V\ 

" Display the current mode and partially-typed commands in the status line
set showmode
set showcmd

" Section: Command line {{{1
"---------------------------------------------------------------------------"

set cmdheight=1
set su=.h,~,.o,.info,.swp,.obj,.pyc      " low priority filetypes

" Section: Formatting {{{1
"---------------------------------------------------------------------------"

filetype plugin on
filetype indent on

"set autoindent
"set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
"set formatoptions=tcrqn2
"set wrapmargin=4
"set lbr
set equalprg=par\ -w79            " use par for =
"set formatprg=par\ -w79          " also use par for gq

" Section: Autocompletion {{{1
"---------------------------------------------------------------------------"
" initialize omnicompletion
if has("autocmd")
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType sql set omnifunc=sqlcomplete#Complete
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
endif

" completion style
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz,*.bak,.DS_Store,*.pyc
set complete=.,k,w,b,u,t,]
"set complete=.,k,w,b,u,t,i,]
set completeopt=longest,menu
set infercase

" Section: Formats and filetypes {{{1
"---------------------------------------------------------------------------"
"valid when compiled with support for autocommands.
if has("autocmd")
  autocmd BufEnter * :syntax sync fromstart

  " use templates
  autocmd BufNewFile * silent! 0r ~/.vim/skel/%:e.tpl

  " strip trailing white space
  autocmd FileType c,cpp,css,java,php,python,html,html.django autocmd BufWritePre <buffer> :%s/\s\+$//e

  " human dicts and speling
  "autocmd FileType mail,human,mkd,txt,vo_base set dict+=/usr/share/dict/words
  autocmd FileType mail,human,mkd,txt,vo_base set spelllang=en_gb

  " dynamically set filetype-specific dictionary
  "autocmd FileType * exec('setlocal dict+=~/.vim/dict/'.expand('<amatch>').'.dict')

  augroup filetype
    autocmd BufRead,BufNewFile *.jade set filetype=jade
    autocmd BufRead,BufNewFile *.less,*.scss set filetype=css
    autocmd BufRead,BufNewFile *.markdown,*.mdown,*.mkdn,*.md set filetype=mkd
    autocmd BufRead,BufNewFile *.webui set filetype=jsp
  augroup END

  augroup css
    autocmd FileType css let css_fold=1
    autocmd FileType css set fen foldmethod=indent
    autocmd FileType css set ai si
  augroup END

  " only show cursorline in current window
  augroup cursorline
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END

  augroup django
    autocmd BufNewFile,BufRead *.html call s:FThtmldjango()
    autocmd FileType htmldjango inoremap {{ {{ }}<left><left><left>
    autocmd FileType htmldjango inoremap {% {% %}<left><left><left>
  augroup END

  augroup mutt
    autocmd FileType mail set nonu noai nosi
    autocmd FileType mail set tw=79 fo=wantq1 smc=0
  augroup END

  augroup text
    autocmd FileType txt set js
    autocmd FileType txt set nosi
    autocmd FileType txt set tw=79 fo+=aw2tq
  augroup END

  augroup markdown
    autocmd FileType mkd set nonu nosi nofen
    "autocmd FileType mkd set ai tw=79 fo+=aw2tq comments=n:>
  augroup END

  " in human-language files, automatically format everything at 79 chars:
  autocmd FileType vo_base,human set nonu ts=4 sts=4 sw=4 tw=79 fo+=aw2tq

  " for C-like programming, have automatic indentation:
  autocmd FileType c,cpp,slang set cindent

  " for actual C (not C++) programming where comments have explicit end
  " characters, if starting a new line in the middle of a comment automatically
  " insert the comment leader characters:
  autocmd FileType c set fo+=ro

  " Python PEP8 compliant indentation - (not needed with python-mode plugin)
  "autocmd FileType python,python.django set ai sr ts=4 sts=4 sw=4
  "autocmd FileType python,python.django set si cinwords=if,elif,else,for,while,try,except,finally,def,class
  "autocmd FileType python,python.django set indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except
  autocmd FileType python,python.django setlocal foldlevel=99

  " Perl, PHP indentation
  autocmd FileType perl,php set ai sr

  " JSP and JSTL indentation
  autocmd FileType jsp set ai

  " format html but leave long lines alone
  autocmd FileType html,xhtml,xml,xsl set nofen foldmethod=indent fo+=tl
  autocmd FileType xml,xslt setlocal iskeyword=@,-,\:,48-57,_,128-167,224-235
else
  set ai ts=2 sts=2 sw=2 " defaults for everything else
endif " end has("autocmd")

" Section: Keymapping {{{1
"---------------------------------------------------------------------------"
"Set leader
let mapleader = ","
let g:mapleader = ","

" disable Ex Mode
nnoremap Q <Nop>

" edit this file
nnoremap <leader>ev :tabe $HOME/.vimrc<cr>

"-- F-keys --"

if has("gui_running")
  " F2 toggle toolbar
  map <silent><F2> :if &guioptions =~# 'T' \| set guioptions-=T \| else \| set guioptions+=T \| endif<CR>
  " CTRL+F2 to toggle the right-hand scroll bar
  nmap <silent><C-F2> :if &guioptions=~'r' \| set guioptions-=r \| else \| set guioptions+=r \| endif<CR>
endif

" F5 list buffers and enter number to switch
nnoremap <F5> :buffers<CR>:buffer<Space>

" F8 mkd preview
noremap <silent><F8> :w!<CR>:!MultiMarkdown.pl % \| tidy -config $HOME/.tidy.conf \| SmartyPants.pl > $HOME/Desktop/%.html && firefox $HOME/Desktop/%.html<CR><CR>

" CTRL+F8 to reformat file as XML
map <silent><C-F8> <Esc>:%!xmllint --format -<CR><CR>
vmap <silent><C-F8> <Esc>:'<, '>!xmllint --format -<CR><CR>

" Bash-like
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-k> <C-U>

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Visual shifting (builtin-repeat)
" Increase indent.
vnoremap <Tab> >gv
" Decrease indent.
vnoremap <S-Tab> <gv

" Standard control-backspace deletion
imap <C-BS> <C-W>

" make CTRL+] behave like CTRL+[ while in insert mode
imap <silent><C-]> <C-[>

" Reformat the current paragraph (or selected text if there is any)
nnoremap <leader>q gqap<CR>
vnoremap <leader>q gq<CR>

" Lazy moving
nnoremap j gj
nnoremap k gk

" Section: Brackets and auto-pairs {{{1
"---------------------------------------------------------------------------"

let g:loaded_matchparen = 1   " Turn off bracket flashing

" Visual mode auto pairs
vnoremap ' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap " <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap < <ESC>`>a><ESC>`<i<<ESC>
vnoremap { <ESC>`>a}<ESC>`<i{<ESC>
vnoremap [ <ESC>`>a]<ESC>`<i[<ESC>
" Insert mode auto pairs
inoremap [ []<ESC>:let leavechar="]"<CR>i
inoremap " ""<ESC>:let leavechar='"'<CR>i
inoremap ( ()<ESC>:let leavechar=")"<CR>i
" complex curlies
inoremap {     {}<ESC>:let leavechar="}"<CR>i
inoremap {<CR> {<CR>}<ESC>O
inoremap {{    {
inoremap {}    {}

imap <C-j> <ESC>:exec "normal f" . leavechar<CR>a

if has("autocmd")
  " css
  autocmd FileType css inoremap :<space> : ;<left>
  autocmd FileType css inoremap (" ("")<ESC>:let leavechar=')'<CR>i<left>

  " Markdown
  autocmd FileType mkd vnoremap i <ESC>`>a*<ESC>`<i*<ESC>
  autocmd FileType mkd vnoremap b <ESC>`>a**<ESC>`<i**<ESC>

  " XML
  autocmd FileType html,xhtml,xml inoremap <buffer><silent> <C-S-B> <ESC>bdwi<<ESC>pa></<ESC>pa><ESC>bba
endif

" Section: Date & time {{{1
"---------------------------------------------------------------------------"

"let g:timestamp_rep = '%Y-%m-%d'  " Format date thusly: YYYY-MM-DD
let g:timestamp_rep = '%Y-%m-%d %I:%M:%S %Z'  " Format date thusly: YYYY-MM-DD h:m:s Z
let g:timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'

"iab <silent> ddate <C-R>=strftime("%d %B %Y")<CR>
"iab <silent> ttime <C-R>=strftime("%I:%M:%S %p %Z")<CR>
"iab <silent> isoD <C-R>=strftime("%Y-%m-%d")<CR>

" Section: Transpose {{{1
"---------------------------------------------------------------------------"

"nnoremap <silent> gb xph      " Transpose current character with next
"nnoremap <silent> gc xhPl     " Transpose current character with previous
"nnoremap <silent> gy dawwPb   " Transpose current word with next
"nnoremap <silent> gl dawbPb   " Transpose current word with previous
"nnoremap <silent> g{ {dap}p{  " Transpose current paragraph with next

" Transpose lines vertically
nmap <C-Up> :<C-u>move .-2<CR>
nmap <C-Down> :<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>
imap <C-Down> <C-o>:<C-u>move .+1<CR>
vmap <C-Up> :move '<-2<CR>gv
vmap <C-Down> :move '>+1<CR>gv

" Section: Plugin-dependent settings {{{1
"---------------------------------------------------------------------------"

" Pathogen - make sure this comes first
execute pathogen#infect()
execute pathogen#helptags()

" Ack
map <leader>a :Ack<space>

" BufExplorer
map <silent><leader>b :BufExplorer<CR>

" gundo
nnoremap <silent><leader>u :GundoToggle<CR>

" html5 omnicomplete
let g:html5_aria_attributes_complete = 0
"let g:html5_microdata_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0

" htmldjango
let g:htmldjangocomplete_html_flavour = "html5"

" NERD_commenter menu
let g:NERDMenuMode = 3
"inoremap <M-/> <ESC>:call NERDComment(0, "toggle")<cr>a
"nnoremap <M-/>/ :call NERDComment(0, "toggle")<cr>
"vnoremap <M-/>/ :call NERDComment(1, "toggle")<cr>

" Toggle NERD_tree
map <C-n> :NERDTreeToggle<CR>

" jedi-vim autocompletion
let g:jedi#completions_command = "<C-J>"

" Disable autocomplpop plugin at startup
let g:acp_enableAtStartup = 0

" ShowMarks
let g:showmarks_enable = 0
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" SuperTab
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" EasyMotion
let g:EasyMotion_leader_key = "<leader><leader>"

" python-mode things
" Disable pylint
let g:pymode_lint = 0
" Disable pylint checking every save
let g:pymode_lint_write = 0
" Set key 'R' for run python code
let g:pymode_run_key = 'R'
" Rope plugin (disable it)
let g:pymode_rope = 0
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime","django"]
let g:pymode_rope_auto_project = 0
" Enable python folding but default to unfolded
let g:pymode_folding = 1

" Taglist
nnoremap <leader>t :Tlist<CR>
nnoremap <leader>to :TlistOpen<CR>
nnoremap <leader>tc :TlistClose<CR>
nnoremap <leader>tu :TlistUpdate<CR>
nnoremap <leader>ts :TlistSessionSave tlist<CR>
nnoremap <leader>tl :TlistSessionLoad tlist<CR>

" ToggleWords/vars/vals
let g:toggle_words_dict = {'python': [['if', 'elif', 'else']]}

" ToggleWord
map <leader>x :ToggleWord<CR>

" Yankring
nnoremap <silent><leader>y :YRShow<CR>
let g:yankring_history_dir = "$HOME/.vim/tmp"
let g:yankring_replace_n_pkey = "<Nop>"
let g:yankring_replace_n_nkey = "<Nop>"

" Section: Experimental {{{1
"---------------------------------------------------------------------------"
"set grepprg to vimgrep function
set grepprg=vimgrep

" convert vimoutliner to mkd
function! VO2MD()
  let lines = []
  let was_body = 0
  for line in getline(1,'$')
    if line =~ '^\t*[^:\t]'
      let indent_level = len(matchstr(line, '^\t*'))
      if was_body " <= remove this line to have body lines separated
        call add(lines, '')
      endif " <= remove this line to have body lines separated
      call add(lines, substitute(line, '^\(\t*\)\([^:\t].*\)', '\=repeat("#", indent_level + 1)." ".submatch(2)', ''))
      call add(lines, '')
      let was_body = 0
    else
      call add(lines, substitute(line, '^\t*: ', '', ''))
      let was_body = 1
    endif
  endfor
  silent %d _
  call setline(1, lines)
endfunction

" convert mkd to vimoutliner
function! MD2VO()
  let lines = []
  for line in getline(1,'$')
    if line =~ '^\s*$'
      continue
    endif
    if line =~ '^#\+'
      let indent_level = len(matchstr(line, '^#\+')) - 1
      call add(lines, substitute(line, '^#\(#*\) ', repeat("\<Tab>", indent_level), ''))
    else
      call add(lines, substitute(line, '^', repeat("\<Tab>", indent_level) . ': ', ''))
    endif
  endfor
  silent %d _
  call setline(1, lines)
endfunction

" Section: Unsorted {{{1
"---------------------------------------------------------------------------"

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Remove pesky DOS/Windows ^M
noremap <leader>m0 mmHmt:%s/<C-V><CR>//ge<cr>'tzt'm

"inoremap <S-Tab> <C-D> " Standard back indentation
" map Shift Insert to [set paste][paste][set nopaste]
map <S-Insert> <ESC>:set paste<CR>"*p:set nopaste<CR>a

"visual to brace match
noremap % v%
"map <S-Insert> <ESC>:set paste<CR>"*p:set nopaste<CR>a

" automatically leave insert mode after 'updatetime' milliseconds of inaction
"au CursorHoldI * stopinsert
"" set 'updatetime' to 5 seconds when in insert mode
"au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
"au InsertLeave * let &updatetime=updaterestore

" restore folds and views
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" Replace the current word with the last-yanked text.
"map <leader>s diw"2

" Time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

" Turn last word into a tag
"inoremap <leader>, <ESC>diwa<<ESC>pa></<ESC>pa><ESC>bba

" unindent
imap <S-Tab> <C-o><<

func! s:FThtmldjango()
  let n = 1
  while n < 30 && n < line("$")
    if getline(n) =~ '.*{%.*'
      set ft=htmldjango
      return
    endif
    let n = n + 1
  endwhile
  set ft=html
endfunc

" escape insert mode immediately
"if ! has('gui_running')
  "set ttimeoutlen=10
  "augroup FastEscape
    "autocmd!
    "autocmd InsertEnter * set timeoutlen=0
    "autocmd InsertLeave * set timeoutlen=1000
  "augroup END
"endif

" }}}

" vim:ft=vim:fdm=marker
