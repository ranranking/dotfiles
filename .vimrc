" Setup NeoBundle  ----------------------------------------------------------{{{
" If neobundle is not installed, do it first
  let bundleExists = 1
  if (!isdirectory(expand("$HOME/.vim/bundle/neobundle.vim")))
     call system(expand("mkdir -p $HOME/.vim/bundle"))
     call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"))
     let bundleExists = 0
  endif
  if 0 | endif

  if has('vim_starting')
    if &compatible
      " Be iMproved
      set nocompatible endif
    endif
 
" Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

" Required:
  call neobundle#begin(expand('~/.vim/bundle/'))
  " let pluginsExist = 1
" Let NeoBundle manage NeoBundle
" Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  
 " Filetype related
  " LaTex
  NeoBundle 'lervag/vimtex'
  " csv
  NeoBundle 'chrisbra/csv.vim'
  " R
  NeoBundle 'jalvesaq/Nvim-R'
  " Markdown
  " NeoBundle 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
  NeoBundle 'suan/vim-instant-markdown'
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'jtratner/vim-flavored-markdown'

 " colorscheme & syntax highlighting
  NeoBundle 'frankier/neovim-colors-solarized-truecolor-only'
  NeoBundle 'mhartington/oceanic-next'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'Raimondi/delimitMate'
  " NeoBundle 'valloric/MatchTagAlways'

 " Git helpers
  " NeoBundle 'tpope/vim-fugitive'

 " untils
  NeoBundle 'benekastah/neomake'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'AndrewRadev/switch.vim'
  NeoBundle 'christoomey/vim-tmux-navigator'
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundleLazy 'gorodinskiy/vim-coloresque', {'autoload': {'filetypes':['vim', 'css', 'r']}}
  " NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf' }
  " NeoBundle 'junegunn/fzf.vim'
  NeoBundle 'terryma/vim-multiple-cursors'
  " NeoBundle 'junegunn/limelight.vim'
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'godlygeek/tabular'
  NeoBundle 'vim-scripts/ingo-library'
  NeoBundle 'unblevable/quick-scope'
  NeoBundle 'luochen1990/rainbow'

 " Shougo
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimproc.vim', {
         \ 'build' : {
         \     'windows' : 'tools\\update-dll-mingw',
         \     'cygwin' : 'make -f make_cygwin.mak',
         \     'mac' : 'make -f make_mac.mak',
         \     'linux' : 'make',
         \     'unix' : 'gmake',
         \    },
         \ }
  NeoBundle 'Shougo/neco-vim'
  NeoBundle 'Shougo/neoinclude.vim'
  NeoBundleLazy 'ujihisa/neco-look',{'autoload':{'filetypes':['markdown', 'tex']}}
  NeoBundle 'Shougo/neosnippet.vim'
  NeoBundle 'Shougo/neosnippet-snippets'
  if has ('nvim')
    NeoBundle 'Shougo/deoplete.nvim'
  else
    NeoBundle 'Shougo/neocomplete.vim'
  endif

  call neobundle#end()

" Required:
  filetype plugin indent on
  let pluginsExist=1
  NeoBundleCheck

" }}}

if pluginsExist
" System Settings  ----------------------------------------------------------{{{

"  Neovim Settings
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let $NEOVIM_JS_DEBUG='~/.nvimjsdebug'
  set clipboard+=unnamedplus

" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
  autocmd BufRead * normal zz

" ================ General Config ====================
filetype on
set cursorline

" set cursorcolumn
" set lines=42
set relativenumber number
set conceallevel=0
set noshowmode
set virtualedit=
set laststatus=2
set nowrap
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set scrolloff=15

" " This makes vim act like all other editors, buffers can
set hidden

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undodir=~/.vim/undo
  set undofile
endif

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Completion =======================

set wildmode=list:longest,full
set wildmenu                      "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*~ 
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
" set wildignore+=*.png,*.jpg,*.gif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" }}}

" System mappings  ----------------------------------------------------------{{{
" For cursor movements
" let mapleader = ','
let mapleader = "\<Space>"
nnoremap ` .
nnoremap \ `
map <S-L> 20l
map <S-H> 20h
map j gj
map k gk
map <S-J> 10gj
map <S-K> 10gk
" inoremap <C-a> <C-O>A
nnoremap ! $


" Regularly used functions
nnoremap <Leader>kl :bd!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <leader><tab> <c-^>
nnoremap <Leader>rl :so ~/.vimrc<CR>
map <Leader>q :q<CR>
map <Leader>s /
imap jj <Esc>
imap <M-Tab> <S-tab>

" For line and space editing
nmap <CR> O<Esc>
nmap <CR><CR> o<Esc>
nmap <space><space> i<space><esc>

" For window resizing
noremap <up>    3<C-W>+
noremap <down>  3<C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" For global copy and paste
" map <C-P> "*p
" vmap <C-Y> "*y

" Neovim terminal mapping
if has ('nvim')
  tnoremap <m-tab> <c-\><c-n>
  nnoremap <m-z> :vsplit<cr>:TmuxNavigateRight<cr>:terminal<cr>
  tnoremap <m-z> <c-\><c-n>:bd!<cr>
endif

" Multiple cursor
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

" FZF 
"  nnoremap <Leader>f :FZF<CR>
"  nnoremap <leader>a :Ag<CR>

"}}}

" Themes  -------------------------------------------------------------------{{{

  syntax enable
  " colorscheme solarized
  if has ('nvim')
    colorscheme solarized
  else
    colorscheme OceanicNext
  endif
  set background=dark

" highlightt the current line number
  hi CursorLineNR guifg=#ffffff

" highlight bad words in red
  hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

" }}}

" Markdown ------------------------------------------------------------------{{{

  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
  autocmd BufNewFile,BufRead *.md filetype indent off 
  autocmd Bufreadpre *.md setlocal wrap linebreak nolist
  let g:instant_markdown_autostart = 0

  nnoremap <Leader>md :InstantMarkdownPreview<CR>

  let g:vim_markdown_folding_disabled = 0
  let g:vim_markdown_math = 1

"}}}

" LaTex ---------------------------------------------------------------------{{{

  autocmd BufRead,BufNewFile *.tex setlocal spell complete+=kspell
  autocmd Bufreadpre *.tex setlocal wrap linebreak nolist

  let g:vimtex_complete_close_braces = 1
  let g:vimtex_fold_manual = 1
  let g:vimtex_fold_comments = 1
  let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
  autocmd Bufreadpre *.tex setlocal foldmethod=expr
  set foldexpr=vimtex#fold#level(v:lnum)
  set foldtext=vimtex#fold#text()
"}}}

" For R ---------------------------------------------------------------------{{{

  " General configurations
  filetype plugin indent on
  let R_start_libs = "raster,base,stats,graphics,grDevices,utils,methods"
  let Rout_more_colors = 1
  let R_vsplit = 1
  let R_in_buffer = 1
  let R_applescript = 1
  " let R_nvim_wd = 1
  vmap <m-Space> <Plug>RDSendSelection
  nmap <m-Space> <Plug>RDSendLine

  " Rout colors
  if &t_Co == 256
       let rout_color_input    = 'ctermfg=247'
       let rout_color_normal   = 'ctermfg=39'
       let rout_color_number   = 'ctermfg=51'
       let rout_color_integer  = 'ctermfg=51'
       let rout_color_float    = 'ctermfg=51'
       let rout_color_complex  = 'ctermfg=51'
       let rout_color_negnum   = 'ctermfg=183'
       let rout_color_negfloat = 'ctermfg=183'
       let rout_color_date     = 'ctermfg=43'
       let rout_color_true     = 'ctermfg=78'
       let rout_color_false    = 'ctermfg=203'
       let rout_color_inf      = 'ctermfg=39'
       let rout_color_constant = 'ctermfg=75'
       let rout_color_string   = 'ctermfg=79'
       let rout_color_error    = 'ctermfg=15 ctermbg=1'
       let rout_color_warn     = 'ctermfg=1'
       let rout_color_index    = 'ctermfg=186'
   endif

"}}}

" Fortran  ------------------------------------------------------------------{{{
autocmd Bufreadpre *.f90 setlocal tw=0
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1
if has('syntax') && (&t_Co > 2)
    syntax enable
endif
"}}}

" Fold, gets it's own section  ----------------------------------------------{{{

  function! MyFoldText() " {{{
      let line = getline(v:foldstart)

      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
      return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
  endfunction " }}}

  set foldtext=MyFoldText()

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  set foldlevel=99
  set nofoldenable    " No fold by default
  set foldnestmax=10  " Deepest fold levels
  autocmd FileType vim setlocal fdc=1
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0

" }}}

" Indent line  --------------------------------------------------------------{{{

" set encoding=utf8
let g:indentLine_color_gui = 'darkblue'
let g:indentLine_char='¦'
let g:indentLine_leadingSpaceChar = '+'
let g:indentLine_enabled=0
let g:indentLine_leadingSpaceEnabled=0
nnoremap <M-q> :IndentLinesToggle<CR>:LeadingSpaceToggle<CR>

"}}}

" Switch  -------------------------------------------------------------------{{{

let g:switch_mapping = '<C-s>'
    let g:switch_custom_definitions =
        \ [
        \   ['0', '1']
        \ ]

"}}}

" NERDTree ------------------------------------------------------------------{{{

  map <Leader>e :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let NERDTreeMapOpenInTabSilent='t'
  let NERDTreeMapOpenInTab='T'
  autocmd StdinReadPre * let s:std_in=1
  let g:NERDTreeWinSize=30
  let g:NERDTreeAutoDeleteBuffer=1
  let g:NERDTreeHighlightCursorline=1
  let g:NERDTreeRespectWildIgnore=1
  let g:NERDTreeIgnore=['\.o$', '\.mod$', '\.out$','\.git$','\.gitignore$']

" NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('f90', 'green', 'none', 'green', 'none')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
  call NERDTreeHighlightFile('gr', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('o', 'cyan', 'none', '#5486C0', 'none')
  call NERDTreeHighlightFile('mod', 'cyan', 'none', '#5486C0', 'none')
  call NERDTreeHighlightFile('r', 'Red', 'none', 'red', 'none')
  call NERDTreeHighlightFile('R', 'Red', 'none', '#ffa500', 'none')
  call NERDTreeHighlightFile('csv', 'Blue', 'none', '#6699cc', 'none')
  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

"}}}

" Snipppets and n/deoplete --------------------------------------------------{{{

" Called once right before you start selecting multiple cursors
if has ('nvim')

  let g:deoplete#enable_at_startup=1
  " let g:deoplete#enable_refresh_always=1
  let g:deoplete#max_list=6
  " let g:deoplete#file#enable_buffer_path=1
  inoremap <expr><tab>
    \ pumvisible() ?
    \ deoplete#mappings#close_popup() : "\<tab>"
  let g:deoplete#enable_smart_case=1
  set completeopt+=noinsert

else

  function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
      exe 'NeoCompleteLock'
    endif
  endfunction

  " Called once only when the multiple selection is canceled (default <Esc>)
  function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
      exe 'NeoCompleteUnlock'
    endif
  endfunction

  " inoremap <silent><expr> <m-tab>
  "   \ pumvisible() ? "\<C-n>" :
  "   \ neoplete#start#manual_complete()
  inoremap <expr><tab>
    \ pumvisible() ?
    \ neoplete#close_popup() : "\<tab>"
  let g:neocomplete#use_vimproc=1
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#max_list=6
  let g:neocomplete#enable_camel_case=1
  " let g:neocomplete#enable_auto_select=0
  let g:neocomplete#enable_fuzzy_completion=1
  let g:neocomplete#enable_auto_close_preview=1

endif



" Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  "
" Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets, ~/.vim/bundle/vim-snippets/snippets'

" SuperTab like snippets behavior.
  imap <expr><M-CR> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><M-CR> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

"}}}

" Tmux navigation -----------------------------------------------------------{{{
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <M-;> :TmuxNavigatePrevious<cr>
  if has ('nvim')
    tmap <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
    tmap <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
    tmap <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
    tmap <M-h> <C-\><C-n>:TmuxNavigateLeft<CR>
    tmap <M-;> <C-\><C-n>:TmuxNavigatePrevious<cr>
  endif
"}}}

" Lightline -----------------------------------------------------------------{{{

  let g:lightline = {
      \ 'colorscheme': 'jellybeans',
        \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'modified' ],
        \           [ 'relativepath' ] ],
        \ 'right': [ [ 'percent' ],
        \            [ 'lineinfo' ],
        \            [ 'filetype' ] ] },
        \ 'inactive': {
        \ 'left': [ [ 'filename' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'fileformat', 'fileencoding'] ] },
        \ 'subseparator': { 'left': '', 'right': '' }
        \}

  let g:lightline.enable = {
        \ 'statusline': 1 
        \}

"}}}

" Rainbow parentheses ------------------------------------------------------{{{

" let g:rainbow_active = 1

map <c-q> :RainbowToggle<CR>
let g:rainbow_conf = {
    \   'guifgs': ['royalblue', 'darkorange', 'darkmagenta', 'firebrick', 'seagreen'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'darkmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue', 'darkorange', 'seagreen', 'firebrick', 'darkorchid'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

"}}}

" unite ---------------------------------------------------------------------{{{

  let g:unite_data_directory='~/.vim/.cache/unite'
  " let g:unite_source_history_yank_enable=1
  let g:unite_prompt='» '
  let g:unite_ignore_source_files = ['*.mod', '*.o', '*.out' ]
  " let g:unite_kind_openable_persist_open_blink_time='0m'
  " " let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']

  " nnoremap <m-tab> :Unite -auto-resize -quick-match -sync -direction='botleft' buffer<CR>
  nnoremap <m-tab> :Unite -auto-resize -start-insert -sync -here buffer<CR>
  nnoremap <Leader>l :Unite -auto-resize -start-insert -complete -sync -here -smartcase line<CR>
  nnoremap <Leader>f :Unite -auto-resize -start-insert -here file_rec/neovim<CR>
  " nnoremap <Leader>e :Unite -auto-resize -auto-preview -keep-focus -here file<CR>
  nnoremap <Leader>g :Unite -here grep:.<CR>
  nnoremap <silent> <leader>up :Unite neobundle/update<CR>

" " Git from unite...ERMERGERD ------------------------------------------------{{{
" let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
" let g:unite_source_menu_menus.git = {
"     \ 'description' : 'Fugitive interface',
"     \}
"   let g:unite_source_menu_menus.git.command_candidates = [
"     \[' git status', 'Gstatus'],
"     \[' git diff', 'Gvdiff'],
"     \[' git commit', 'Gcommit'],
"     \[' git stage/add', 'Gwrite'],
"     \[' git checkout', 'Gread'],
"     \[' git rm', 'Gremove'],
"     \[' git cd', 'Gcd'],
"     \[' git push', 'exe "Git! push " input("remote/branch: ")'],
"     \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
"     \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
"     \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
"     \[' git fetch', 'Gfetch'],
"     \[' git merge', 'Gmerge'],
"     \[' git browse', 'Gbrowse'],
"     \[' git head', 'Gedit HEAD^'],
"     \[' git parent', 'edit %:h'],
"     \[' git log commit buffers', 'Glog --'],
"     \[' git log current file', 'Glog -- %'],
"     \[' git log last n commits', 'exe "Glog -" input("num: ")'],
"     \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
"     \[' git log until date', 'exe "Glog --until=" input("day: ")'],
"     \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
"     \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
"     \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
"     \[' git mv', 'exe "Gmove " input("destination: ")'],
"     \[' git grep',  'exe "Ggrep " input("string: ")'],
"     \[' git prompt', 'exe "Git! " input("command: ")'],
"     \] " Append ' --' after log to get commit info commit buffers
"   nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>
"}}}

endif
