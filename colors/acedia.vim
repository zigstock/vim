" vim color file: acedia.vim
" A slothful colour scheme: gui light, console dark
" Fergus Bremner <fergus.bremner@gmail.com>

" GUIDE {{{
" GUI colours as follows:
" Black   #202020 
" Blue    #000099
" Grey    #555555
" Green   #007777
" Purple  #990066 
" Maroon  #AA0000
" Rust    #993300
" Pink    #FF3399
" Yellow  #FFFFCC
" White   #FFFFFF
"}}}
" INIT {{{

if &t_Co != 256 && ! has("gui_running")
  echomsg "Please switch to a GUI-based vim or a 256-color terminal"
  set background=dark
elseif (has("gui_running"))
  set background=light
else
  set background=dark
endif

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="acedia"

"}}}
" SYNTAX - global {{{
hi Cursor           gui=none   guifg=white     guibg=#555555   ctermbg=244 

hi Normal           gui=none   guifg=black     guibg=white     ctermfg=white     ctermbg=black cterm=none
hi NonText          gui=none   guifg=#555555   guibg=white     ctermfg=darkgray

hi Comment          gui=none   guifg=#555555                   ctermfg=242       cterm=none

hi Constant         gui=none   guifg=#007777                   ctermfg=white
hi String           gui=none   guifg=#FF3399                   ctermfg=magenta   cterm=none
hi Character        gui=bold   guifg=red                       ctermfg=yellow    cterm=none
hi Number           gui=none   guifg=black                     ctermfg=magenta
hi Boolean          gui=none   guifg=#990066                   ctermfg=magenta   cterm=none
hi Float            gui=none   guifg=red                       ctermfg=yellow    cterm=none

hi Identifier       gui=none   guifg=#000099                   ctermfg=blue
hi Function         gui=none   guifg=#000099                   ctermfg=darkblue  cterm=none

hi Statement        gui=none   guifg=#000099                   ctermfg=blue
hi Conditional      gui=none   guifg=#000099                   ctermfg=darkblue   cterm=none
hi Repeat           gui=none   guifg=#990066                   ctermfg=darkblue  cterm=none
hi Label            gui=none   guifg=#990066                   ctermfg=darkblue  cterm=none
hi Operator         gui=none   guifg=black                     ctermfg=white     cterm=none
hi Keyword          gui=none   guifg=#000099   guibg=bg        ctermfg=darkblue  cterm=none
hi Exception        gui=none   guifg=#555555                   ctermfg=242       cterm=none

hi PreProc          gui=none   guifg=#990066                   ctermfg=darkblue
hi Include          gui=none   guifg=#000099   guibg=bg        ctermfg=darkblue   cterm=none
hi Define           gui=none   guifg=#990066                   ctermfg=red        cterm=none
hi Macro            gui=none   guifg=#FF3399   guibg=bg        ctermfg=magenta    cterm=none
hi PreCondit        gui=none   guifg=#990066                   ctermfg=darkmagenta

hi Type             gui=none   guifg=#990066                   ctermfg=white      cterm=none
hi StorageClass     gui=none   guifg=#000099                   ctermfg=darkblue
hi Structure        gui=none   guifg=#990066                   ctermfg=darkblue
hi Typedef          gui=none   guifg=#990066                   ctermfg=red

hi Special          gui=none   guifg=black                     ctermfg=white     cterm=none
hi SpecialChar      gui=none   guifg=black                     ctermfg=none      cterm=none
hi Tag                                                         ctermfg=red       ctermbg=bg                    
hi Delimiter        gui=none   guifg=black                     ctermfg=white     cterm=none
hi SpecialComment   gui=none   guifg=#555555                   ctermfg=red       cterm=none
hi Debug            gui=none   guifg=#555555                   ctermfg=red       cterm=none

hi Error            gui=none   guifg=white     guibg=red       ctermfg=white     ctermbg=darkred

hi Todo             gui=none   guifg=black     guibg=yellow    ctermfg=black   ctermbg=228

"}}}
" UI - utils {{{
hi Title            gui=none   guifg=maroon                    ctermfg=red   cterm=none
hi Directory        gui=none   guifg=darkblue                  ctermbg=blue
hi Folded           gui=none   guifg=#202020    guibg=#B2B2B2  ctermfg=black   ctermbg=gray
hi FoldColumn       gui=none   guifg=#202020    guibg=#B2B2B2  ctermfg=red     ctermbg=gray
hi Search           gui=none   guibg=yellow                    ctermfg=black   ctermbg=blue      cterm=none
hi IncSearch        gui=none   guibg=yellow                    ctermfg=black   ctermbg=228       cterm=none
hi Visual           gui=none   guibg=#b8d5ff    guifg=black    ctermbg=black   ctermfg=228       cterm=reverse

hi WildMenu         gui=none   guibg=gray       guifg=black
hi MatchParen       gui=none   guibg=gray

hi ModeMsg          gui=none
hi MoreMsg          gui=reverse
hi Question         gui=none   guifg=red       guibg=yellow
hi WarningMsg       gui=none   guifg=red

hi BadWord          gui=bold   guifg=#000099   guibg=#FFDDDD
hi DoubleWord       gui=bold   guifg=#000099   guibg=#FFEECC

hi DiffAdd          gui=none    ctermfg=black   ctermbg=blue     cterm=none
hi DiffChange       gui=none    ctermfg=black   ctermbg=magenta  cterm=none
hi DiffDelete       gui=none    ctermfg=black   ctermbg=none     cterm=none
hi DiffText         gui=none    ctermfg=black   ctermbg=yellow   cterm=none
"}}}
" UI - chrome {{{
hi CurrentLine      gui=none   guibg=#FFFFBB   ctermfg=yellow   ctermbg=none   cterm=none
hi CursorLine       gui=none   guibg=#FFFCCF   ctermfg=none     ctermbg=234    cterm=none
hi CursorColumn     gui=none   guibg=#FFEEDD   ctermfg=darkgray cterm=none
hi LineNr           gui=none   guifg=#999999   guibg=#E8E8E8    ctermfg=240       ctermbg=235       cterm=none
hi StatusLine       gui=none   guifg=white     guibg=#555555    ctermfg=white     ctermbg=240     cterm=none
hi StatusLineNC     gui=none   guifg=white     guibg=#555555    ctermfg=black     ctermbg=240  cterm=none
hi VertSplit        gui=none   guifg=white     guibg=#333333    ctermfg=black     ctermbg=darkgray  cterm=reverse
"}}}
" UI - vim 7+ {{{
if v:version >= 700
  hi Pmenu          gui=none       guifg=#4D4D4D   guibg=#E8E8E8   ctermbg=235  ctermfg=grey
  hi PMenuSel       gui=none       guifg=#FFFFFF   guibg=#7499BF   ctermbg=240  ctermfg=white
  hi PmenuSbar      gui=none       guifg=fg        guibg=#41609E   ctermbg=240   
  hi PmenuThumb     gui=none       guifg=bg        guibg=#BDCAE3   ctermbg=blue
  hi SpellBad       gui=undercurl  guisp=red                           
  hi SpellRare      gui=undercurl  guisp=orange                        
  hi SpellLocal     gui=undercurl  guisp=orange                        
  hi SpellCap       gui=undercurl  guisp=yellow                        
endif
"}}}
" SYNTAX - css {{{
hi cssAttr          gui=none       guifg=#990066   ctermfg=gray
hi cssBraces        gui=none       guifg=black     ctermfg=white
hi cssClassName     gui=none       guifg=#000099   ctermfg=cyan
"hi cssColor         gui=none       guifg=#AA0000   ctermfg=gray
hi cssIdentifier    gui=none       guifg=black     ctermfg=white
hi cssImportant     gui=none       guifg=red       ctermfg=red
"hi cssMedia         gui=none       guifg=#000099
"hi cssNumber        gui=none       guifg=black     ctermfg=red
"hi cssProp          gui=none       guifg=#990066   ctermfg=gray
"hi cssPrefix        gui=none       guifg=black     ctermfg=white
"hi cssPseudo        gui=none       guifg=#990066   ctermfg=magenta
hi cssTagName       gui=none       guifg=black     ctermfg=white
hi cssUnits         gui=none       guifg=red       ctermfg=red
"}}}
" SYNTAX - html {{{
hi htmlBoldUnderline  gui=underline
hi htmlBold           gui=none
hi htmlBoldItalic     gui=none
hi htmlBoldUnderlineItalic gui=underline

hi htmlH1            gui=none       guifg=#336699     guibg=bg
hi htmlH2            gui=none       guifg=#336699     guibg=bg
hi htmlH3            gui=none       guifg=#336699     guibg=bg
hi htmlH4            gui=none       guifg=#336699     guibg=bg
hi htmlH5            gui=none       guifg=#336699     guibg=bg
hi htmlH6            gui=none       guifg=#336699     guibg=bg
"}}}

" vim:ft=vim:fdm=marker
