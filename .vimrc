" Vimrc
" last changes: RS10122004

if has("terminfo")
  set t_Co=16
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make Ctrl+T open a new tab.
noremap     <C-T>               :tabnew<CR>
vnoremap    <C-T>               <C-C>:tabnew<CR>
inoremap    <C-T>               <C-O>:tabnew<CR>

" Make Ctrl+N select the next tab.
noremap     <C-N>               :tabn<CR>
vnoremap    <C-N>               <C-C>:tabn<CR>
inoremap    <C-N>               <C-O>:tabn<CR>

" Make Ctrl+P select the previous tab.
noremap     <C-P>               :tabp<CR>
vnoremap    <C-P>               <C-C>:tabp<CR>
inoremap    <C-P>               <C-O>:tabp<CR>

" Make Ctrl+W close all tabs
noremap     <C-W>               :tabdo tabclose<CR>
vnoremap    <C-W>               <C-C>:tabdo tabclose<CR>
inoremap    <C-W>               <C-O>:tabdo tabclose<CR>

" To not screw up pasted text ;-)
set pastetoggle=<F12>
set ignorecase

" Tab size, shiftwidth, softtabsize, expandtabs
set ts=4 
set sw=4 
"sts=4 
"set et

" C/C++ style indenting
set cindent

" Always show statusline
set laststatus=2

" Tags
set notr
set tags=$TAGDIR/TAGS

" Let the % key match <> pairs; useful for C++ templates.
set mps+=<:>

" Bell - disable
set vb t_vb=

" No backups
set nobackup
set nowritebackup

" Enable word wrap
set wrapmargin=1

" Enable spellcheck
runtime plugin/engspchk

"syntax on

" ==============
" Colorization
" ==============

"    Normal text:    Use white on black.
" hi normal ctermfg=white ctermbg=black   guifg=white guibg=black
" Oops - this overrides the colors for the status line - DANG!

"    Comments: Colorizing the "comments" (see ":help comments").
"    cyan on white does not look good on a black background..
" hi comment                           ctermfg=cyan   ctermbg=black
" hi comment                           ctermfg=cyan   ctermbg=7

"    LineNr:  Colorize the line numbers (displayed with "set number").
"    Turn off default underlining of line numbers:
  hi LineNr       term=NONE cterm=NONE

"    Normal:  Coloring the text with a default color.
  hi Normal guibg=#282850 guifg=white gui=NONE cterm=NONE

" coloring "nontext", ie TABs, trailing spaces,  end-of-lines,
" and the "tilde lines" representing lines after end-of-buffer.
  hi NonText ctermfg=blue guifg=blue gui=NONE cterm=NONE

"    Search: Coloring "search matches".
  hi search  ctermfg=white ctermbg=blue     guifg=white guibg=blue

"    statusline:  coloring the status line
  hi statusline   term=NONE cterm=NONE ctermfg=lightred ctermbg=red
  hi statuslineNC term=NONE cterm=NONE ctermfg=black  ctermbg=black

  hi Cursor ctermbg=yellow guibg=yellow gui=NONE cterm=NONE
  hi Constant ctermfg=magenta guifg=magenta gui=NONE cterm=NONE
  hi Comment ctermfg=cyan guifg=cyan gui=NONE cterm=NONE
  hi Statement ctermfg=yellow guifg=yellow gui=NONE cterm=NONE
  hi Type ctermfg=lightgreen guifg=lightgreen gui=NONE cterm=NONE
  hi PreProc ctermfg=lightblue guifg=lightblue gui=NONE cterm=NONE

" ==============
" Mappings
" ==============

" Attribution Fixing: from "Last, First" to "First Last":
  map ,ATT gg}jWdWWPX

" ============================================================
" Options() - used to display some important option values
" within the status line (see below at "set statusline".
" ============================================================
" 
" Statusline without colors and display of options -
" but with percentage at end:
" set statusline=Vim-%{Version()} [%02n]\ %(%M%R%H%)\ %F\ %=<%l,%c%V>\ %P
"
" Damien WYART <wyart@iie.cnam.fr> [000329]:
" set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ \ %-25(%3l,%c%03V\ \ %P\ (%L)%)%12o'%03b'
" hi  User1 term=inverse,bold cterm=inverse,bold ctermfg=red

"fu! Options()
"           let opt="Opt:"
"            let opt=""
  " autoindent
" if &ai|   let opt=opt." ai"   |else|let opt=opt." noai"   |endif
"  if &ai|   let opt=opt." ai"   |endif
  "  expandtab
" if &et|   let opt=opt." et"   |else|let opt=opt." noet"   |endif
"  if &et|   let opt=opt." et"   |endif
  "  hlsearch
" if &hls|  let opt=opt." hls"  |else|let opt=opt." noet"   |endif
"  if &hls|  let opt=opt." hls"  |endif
  "  paste
" if &paste|let opt=opt." paste"|else|let opt=opt." nopaste"|endif
"  if &paste|let opt=opt." paste"|endif
  "  shiftwidth
"  if &shiftwidth!=8|let opt=opt." sw=".&shiftwidth|endif
""  "  textwidth - show always!
                    ""let opt=opt." tw=".&tw
"   let opt=opt."\[".&lines.",".&columns."\]"
"  return opt
""endf


" ============================================================
" Colorizing that status lines!  Whee!  :-)
" ============================================================
" 
" Statusline without colors and display of options -
" but with percentage at end:
" set statusline=Vim-%{Version()} [%02n]\ %(%M%R%H%)\ %F\ %=<%l,%c%V>\ %P

"set   statusline=Vim-%{Version()}\ %{getcwd()}\ \ %1*[%02n]%*\ %(%M%R%H%)\ %2*%F%*\ %=%{Options()}\ %3*<%l,%c%V>%*
  set   statusline=%1*[%02n]%*\ %(%M%R%H%)\ %2*%F%*\ %3*<%l,%c%V>%*

" Text between "%{" and "%}" is being evaluated and thus suited for functions.
" Here I will use the function "Options()" as defined below to show the
" values of some (local) options..
" The strings "%N*" unto "%*" correspond to the highlight group "UserN":
"       User1: color for buffer number
hi    User1 cterm=NONE    ctermfg=white   ctermbg=red  guifg=white   guibg=red
"       User2: color for filename
hi    User2 cterm=NONE    ctermfg=yellow  ctermbg=red  guifg=yellow  guibg=red
"       User3: color for position
hi    User3 cterm=NONE    ctermfg=white   ctermbg=red  guifg=white   guibg=red

fu! Version()
   return version
endf

set bg=light
