" vim-notes
" in command-line mode
" % current filename, %:p current full filename

" =============================== Basic ====================================

" neccesary setup
set nocompatible
syntax on
set nobackup
set noswapfile
set clipboard=unnamedplus

set term=xterm-256color
set background=dark
au BufEnter * if &filetype == "" | setlocal ft=conf | endif

" set noerrorbells visualbell t_vb=
" autocmd TabEnter * set visualbell t_vb=

" some command-line mode bindings, use ,: to enter : in command-line
cnoremap : w<space>!
cnoremap ,: :
let $BASH_ENV="~/.zshrc"

" some leader bindings
let mapleader="\<Space>"
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <leader>x :tabclose<cr>
nnoremap <leader>w :w<cr>
" nnoremap <leader>q :tabfirst<cr>:tabonly<cr><c-z>
nnoremap <leader>q :qa!<cr>

nnoremap <leader>t :YcmCompleter GoTo<cr>
" nnoremap <c-g> :YcmCompleter GoTo<cr>
" nnoremap <c-h> <c-o>
" nnoremap <c-l> <c-i>

" cross display
au BufEnter * setlocal cursorline cursorcolumn
au WinLeave * setlocal nocursorline nocursorcolumn
hi Cursorline cterm=NONE ctermbg=235
hi Cursorcolumn cterm=NONE ctermbg=235
au FileType tagbar setlocal nocursorline nocursorcolumn

"status line
set laststatus=2
set statusline=
set statusline+=%1*\ %<\ %F
set statusline+=%1*\ %m%r 
set statusline+=%=                                "separator between left and right
set statusline+=%1*\ %-20((%P)%L\ \ %5l,%-3c%)

" status line and vertical border
set fillchars+=vert:\  "there must be a trailling blank at the end
hi User1 ctermfg=102 ctermbg=235
hi VertSplit ctermfg=235
hi StatusLine ctermfg=235
hi StatusLine ctermbg=235
hi StatusLineNC ctermfg=235
hi StatusLineNC ctermbg=235

" tab line
hi TabLineFill ctermfg=235
hi TabLine cterm=bold ctermbg=235 ctermfg=30
hi TabLineSel ctermfg=28

" visual mode
hi Visual ctermbg=166

" pop-up menu
hi Pmenu ctermbg=235 ctermfg=173
hi PmenuSel ctermbg=237 ctermfg=173
hi PmenuSbar ctermbg=235
hi PmenuThumb ctermbg=237

" change cursor color in different modes
let &t_SI="\<Esc>]12;green\x7"
let &t_EI="\<Esc>]12;purple\x7"

" line number
set number
set numberwidth=4
set ruler

" tab
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" indent
set smartindent
set autoindent
set backspace=indent,eol,start
set showcmd
set showmode
set showmatch

" search
set incsearch
set hlsearch
nnoremap <leader>c :nohlsearch<cr>
" nnoremap <leader>cp :TagbarClose<cr>:set nonumber<cr>
" nnoremap <leader>nm :TagbarOpen<cr>:set number<cr>
set ignorecase
set smartcase
set isk+=-

" wrap
set wrap
set wrapmargin=0
set linebreak
set nolist
set textwidth=0

" misc
set confirm
set cmdheight=1

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8
set scrolloff=3

" bind <esc> to hl in Insert mode and Visual
inoremap hl <esc>
vnoremap hl <esc>

" change bindings for moving between windows
nnoremap J  <C-w>j
nnoremap K  <C-w>k
nnoremap H  <C-w>h
nnoremap L  <C-w>l

" =============================== Optional ====================================

" colorscheme ron
" hi Pmenu ctermbg=235 ctermfg=173
" hi Pmenu ctermbg=235 ctermfg=37

" cabbrev ! w<space>!
" nnoremap <leader>q :wqa<cr>

" set colorcolumn=85

" python
" au FileType python setlocal tabstop=4

" fold
" set foldmethod=indent

" unmap <esc> for adapting to hl
" inoremap <esc> <nop>
" vnoremap <esc> <nop>

" =============================== Vundle ====================================

filetype off
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'valloric/youcompleteme'
"Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
" Plug 'rust-lang/rust.vim'
Plug 'kshenoy/vim-signature'
" Plug 'ternjs/tern_for_vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }

call plug#end()
filetype on

" =============================== Plugin ====================================

filetype plugin on

" nerdtree
let NERDTreeWinPos=1
" nerdtree-tabs
map <leader>n <plug>NERDTreeTabsToggle<cr>

" nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
" let g:NERDCompactSexyComs=1

" emmet
" let g:user_emmet_leader_key='<leader>t'

" ctrlp
" let g:ctrlp_map='<leader>p'
" let g:ctrlp_cmd='CtrlP'
let g:ctrlp_use_caching=1
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("j")':   ['<s-tab>'],
      \ 'PrtSelectMove("k")':   ['<tab>'],
      \ 'AcceptSelection("t")': ['<cr>'],
      \ 'PrtClearCache()':      ['<F5>'],
      \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
      \ 'ToggleFocus()':        ['<c-j>'],
      \ 'PrtExpandDir()':       ['<c-k>'],
      \ }
let g:ctrlp_custom_ignore = {
      \'dir':'\v[\/]node_modules$',
      \}

" vim-go
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_interfaces=1
let g:go_highlight_operators=1
let g:go_highlight_build_constrants=1
let g:go_gocode_unimported_packages=1
let g:go_fmt_command='goimports'
" let g:go_fmt_autosave=0

" auto-pairs
let g:AutoPairsCenterLine=0

" autoformat
" let g:formatters_go = ['goimports']
" let g:autoformat_verbosemode=1
" au BufWrite *.go :Autoformat

" tagbar
let g:tagbar_left=1
let g:tagbar_width=50
let g:tagbar_iconchars=['▸', '▾']
" au FileType go nested :TagbarOpen
au FileType go,javascript,rust nested call ResizeTagbar()
au VimResized * call ResizeTagbar()
let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \'T:type',
      \'f:function',
      \'g:enum',
      \'s:struct',
      \'m:module',
      \'c:const',
      \'t:trait',
      \'i:impl',
      \]
      \}
let g:tagbar_type_javascript = {
      \ 'ctagstype' : 'javascript',
      \ 'kinds' : [
      \'a:const',
      \'b:let',
      \'d:var',
      \'e:function',
      \'h:class',
      \],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \}

" ycm
set completeopt -=preview
set completeopt=longest,menu
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_goto_buffer_command='new-or-existing-tab'


" ag
let g:ag_working_path_mode='r'


" =================================== fzf ======================================
nnoremap <leader>p :FZF<cr>
" This is the default extra key bindings
let g:fzf_action = {
      \ 'enter': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>



" ============================ Language Specific ==============================

" go
augroup go
  autocmd!
  au FileType go nnoremap <leader>r :w !go run %<cr>
  au FileType go setlocal expandtab
augroup END

" rust
augroup rust
  autocmd!
  au FileType rust nnoremap <leader>r :w !cargo check -q && cargo run<cr>
  au FileType rust setlocal expandtab
augroup END

" lisp
augroup lisp
  autocmd!
  au BufRead *.el set noautoindent
  au BufRead *.el nnoremap <leader>r :w !~/.util/el-to-lisp < % \| sbcl --script<cr>
  au BufRead *.lisp nnoremap <leader>r :w !sbcl --script %<cr>
  au BufRead *.el call RegisterGlobals()
  au BufWritePre *.el call IndentEl()
augroup END

" sh
augroup sh
  autocmd!
  au BufRead *.sh nnoremap <leader>r :w !bash %<cr>
augroup END

" node.js
augroup node
  autocmd!
  au BufRead *.js nnoremap <leader>r :w !node %<cr>
  au BufWritePre *.js call Format("js")
  au BufRead *.js setlocal expandtab
augroup END

" html
augroup html
  autocmd!
  au BufWritePre *.html call Format("html")
augroup END

" css
augroup css
  autocmd!
  au BufWritePre *.css call Format("css")
augroup END

" c
augroup c
  autocmd!
  au BufRead *.c nnoremap <leader>r :w !gcc % -o /tmp/c-compiled-random-string && /tmp/c-compiled-random-string<cr>
  au BufRead *.c setlocal expandtab
augroup END

" python
augroup python
  autocmd!
  au FileType python setlocal expandtab
  au FileType python setlocal ts=4 sw=4 sts=4
augroup END

" ===============================  tagbar  ====================================
" resize tagbar according to main window's size
function ResizeTagbar()
  " debug
  " echom winwidth(0).":".winwidth(1)
  if winwidth(0) < 100
    execute "TagbarClose"
  else
    execute "TagbarOpen"
  endif
endfunction

" ===============================    fmt   ====================================
function Format(arg)

  if a:arg == "js"
    let l:cmd = "js-beautify -r -n -s 2 -m 2 -b collapse-preserve-inline"
  elseif a:arg == "go"
    let l:cmd = "goimports -w"
  elseif a:arg == "html"
    let l:cmd = "js-beautify --html -r -n -s 2 -m 2"
  elseif a:arg == "css"
    let l:cmd = "js-beautify --css -r -n -s 2"
  endif

  let l:curw = winsaveview()

  " Write current unsaved buffer to a temp file
  let l:tmpname = tempname()
  call writefile(getline(1, '$'), l:tmpname)
  call system(l:cmd ." ". l:tmpname)

  try | silent undojoin | catch | endtry

  " Replace current file with temp file, then reload buffer
  let old_fileformat = &fileformat
  if exists("*getfperm")
    " save old file permissions
    let original_fperm = getfperm(expand('%'))
  endif
  call rename(l:tmpname, expand('%'))
  " restore old file permissions
  if exists("*setfperm") && original_fperm != ''
    call setfperm(expand('%'), original_fperm)
  endif
  silent edit!
  let &fileformat = old_fileformat
  let &syntax = &syntax

  call winrestview(l:curw)

endfunction
