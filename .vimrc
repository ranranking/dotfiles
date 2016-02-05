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
      set nocompatible
    endif

" Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

" Required:
  call neobundle#begin(expand('~/.vim/bundle/'))
  let pluginsExist = 1
" Let NeoBundle manage NeoBundle
" Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

" Filetype related
  " LaTex
  NeoBundle 'lervag/vimtex'
  " csv
  NeoBundle 'https://github.com/chrisbra/csv.vim'
  " R
  NeoBundle 'jalvesaq/Nvim-R'
  " Markdown
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'suan/vim-instant-markdown'

 " colorscheme & syntax highlighting
  NeoBundle 'frankier/neovim-colors-solarized-truecolor-only'
  NeoBundle 'mhartington/oceanic-next'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'valloric/MatchTagAlways'

 " Git helpers
  " NeoBundle 'tpope/vim-fugitive'
  " NeoBundle 'jreybert/vimagit'
  " NeoBundle 'airblade/vim-gitgutter'
  " NeoBundle 'Xuyuanp/nerdtree-git-plugin'
  " NeoBundle 'https://github.com/jaxbot/github-issues.vim'

 " untils
  NeoBundle 'benekastah/neomake'
  NeoBundle 'editorconfig/editorconfig-vim'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'AndrewRadev/switch.vim'
  NeoBundle 'christoomey/vim-tmux-navigator'
  " NeoBundle 'tmux-plugins/vim-tmux'
  " NeoBundle 'tmux-plugins/vim-tmux-focus-events'
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'gorodinskiy/vim-coloresque'
  NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf' }
  NeoBundle 'junegunn/fzf.vim'
  NeoBundle 'terryma/vim-multiple-cursors'
  " NeoBundle 'junegunn/limelight.vim'
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'godlygeek/tabular'
  NeoBundle 'vim-scripts/ingo-library'

 " Shougo
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/unite-outline'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'Shougo/vimfiler.vim'
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
  NeoBundleLazy 'ujihisa/neco-look',{'autoload':{'filetypes':['markdown']}}
  NeoBundle 'Shougo/neosnippet.vim'
  NeoBundle 'Shougo/neosnippet-snippets'
  if has ('nvim')
    NeoBundle 'Shougo/deoplete.nvim'
  endif

  call neobundle#end()

" Required:
  filetype plugin indent on
  let pluginsExist=1
  NeoBundleCheck

" }}}

if pluginsExist
" System Settings  ----------------------------------------------------------{{{

 " Neovim Settings
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

  " enable deoplete
  let g:deoplete#enable_at_startup = 1


" ================ General Config ====================

filetype on
let mapleader = ','
set relativenumber number
set conceallevel=0
set noshowmode
set virtualedit=
set laststatus=2
set nowrap
set number                      "Line numbers are good
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
set wildignore=*.mod,*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" For indentLine
set encoding=utf8
let g:indentLine_color_gui = '#c0cbff'
let g:indentLine_char='¦'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_noConcealCursor=""
let g:indentLine_enabled=0
let g:indentLine_leadingSpaceEnabled=0
nnoremap <M-q> :IndentLinesToggle<CR>:LeadingSpaceToggle<CR>

" }}}

" System mappings  ----------------------------------------------------------{{{
" For cursor movements
map <S-L> 20l
map <S-H> 20h
map j gj
map k gk
map <S-J> 10gj
map <S-K> 10gk
inoremap <C-a> <C-O>A

" For line and space editing
nmap <CR> O<Esc>
nmap <CR><CR> o<Esc>

nmap <space><space> i<space><esc>

" For global copy and paste
" map <C-P> "*p
" vmap <C-Y> "*y

" Neovim terminal mapping
if has ('nvim')
  tnoremap <esc> <c-\><c-n>
  nnoremap <c-z> :vsplit<cr>:TmuxNavigateRight<cr>:terminal<cr>
  tnoremap <c-z> <c-\><c-n>:bd!<cr>
  nnoremap <m-z> <c-z>
endif

" Multiple cursor
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

" FZF 
 nnoremap <F8> :FZF<CR>
 map <leader>a :Ag<CR>

"}}}

" Themes, Commands, etc  ----------------------------------------------------{{{

" Theme
  syntax enable
  if has ('nvim')
    colorscheme solarized
  else
    colorscheme OceanicNext
  endif
  set background=dark

" highlightt the current line number
  hi CursorLineNR guifg=#ffffff

" no need to fold things in markdown all the time
  let g:vim_markdown_folding_disabled = 1

" turn on spelling for markdown and latex files
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
  autocmd BufRead,BufNewFile *.tex setlocal spell complete+=kspell

" highlight bad words in red
  hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

" disable markdown auto-preview. Gets annoying
  let g:instant_markdown_autostart = 0

" For markdown indent and textwidth
autocmd BufNewFile,BufRead *.md filetype plugin indent off 
autocmd Bufreadpre *.md setlocal wrap linebreak nolist
autocmd Bufreadpre *.tex setlocal wrap linebreak nolist

" }}}

" LaTex ----------------------------------------------{{{

  let g:vimtex_complete_close_braces = 1
  let g:vimtex_fold_manual = 1
  let g:vimtex_fold_comments = 1
  let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
  autocmd Bufreadpre *.tex setlocal foldmethod=expr
  set foldexpr=vimtex#fold#level(v:lnum)
  set foldtext=vimtex#fold#text()
"}}}

" For R ----------------------------------------------{{{

  " General configurations
  filetype plugin indent on
  let R_start_libs = "raster,base,stats,graphics,grDevices,utils,methods"
  let Rout_more_colors = 1
  let R_vsplit = 1
  let R_in_buffer = 1
  let R_applescript = 1
  " let R_nvim_wd = 1
  vmap <C-Space> <Plug>RDSendSelection
  nmap <C-Space> <Plug>RDSendLine

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

" Fortran  ----------------------------------------------{{{
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

" Switch  ----------------------------------------------{{{

let g:switch_mapping = '<C-s>'
    let g:switch_custom_definitions =
        \ [
        \   ['0', '1']
        \ ]

"}}}

" NERDTree ------------------------------------------------------------------{{{

  map <F9> :NERDTreeToggle<CR>
  autocmd StdinReadPre * let s:std_in=1
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=30
  let g:NERDTreeAutoDeleteBuffer=1

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

" Snipppets and deoplete -----------------------------------------------------------------{{{


" Maxmimum list length
  let g:deoplete#max_list=6
" Use tab to navigate in deoplete
	inoremap <silent><expr> <M-Tab> pumvisible() ? "\<C-n>" :deoplete#mappings#manual_complete()
" Close deoplete popup
	" inoremap <expr><C-TAB>  deoplete#mappings#smart_close_popup()."\<C-h>"

" Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
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

" unite ---------------------------------------------------------------------{{{

  let g:unite_data_directory='~/.vim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_prompt='» '
  let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']

  nnoremap <silent> <leader>f :Unite -auto-resize -start-insert -direction=botright file_rec/neovim2<CR>
  " nnoremap <silent> <leader>c :Unite -auto-resize -start-insert -direction=botright colorscheme<CR>
  nnoremap <silent> <leader>up :Unite neobundle/update<CR>

  function! s:unite_settings() "{{{
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  endfunction "}}}

" Git from unite...ERMERGERD ------------------------------------------------{{{
let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
let g:unite_source_menu_menus.git = {
    \ 'description' : 'Fugitive interface',
    \}
  let g:unite_source_menu_menus.git.command_candidates = [
    \[' git status', 'Gstatus'],
    \[' git diff', 'Gvdiff'],
    \[' git commit', 'Gcommit'],
    \[' git stage/add', 'Gwrite'],
    \[' git checkout', 'Gread'],
    \[' git rm', 'Gremove'],
    \[' git cd', 'Gcd'],
    \[' git push', 'exe "Git! push " input("remote/branch: ")'],
    \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
    \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
    \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
    \[' git fetch', 'Gfetch'],
    \[' git merge', 'Gmerge'],
    \[' git browse', 'Gbrowse'],
    \[' git head', 'Gedit HEAD^'],
    \[' git parent', 'edit %:h'],
    \[' git log commit buffers', 'Glog --'],
    \[' git log current file', 'Glog -- %'],
    \[' git log last n commits', 'exe "Glog -" input("num: ")'],
    \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
    \[' git log until date', 'exe "Glog --until=" input("day: ")'],
    \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
    \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
    \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
    \[' git mv', 'exe "Gmove " input("destination: ")'],
    \[' git grep',  'exe "Ggrep " input("string: ")'],
    \[' git prompt', 'exe "Git! " input("command: ")'],
    \] " Append ' --' after log to get commit info commit buffers
  nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>
"}}}


" Navigate between vim buffers and tmux panels ------------------------------{{{
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

" vim-airline ---------------------------------------------------------------{{{
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tab_type = 0
  set hidden
  " let g:airline#extensions#tabline#fnamemod = ':t'
  " let g:airline#extensions#tabline#show_tab_nr = 1
  " let g:airline_powerline_fonts = 1
  let g:airline_theme='solarized'
  " let g:airline#extensions#bufferline#enabled = 1
  " let g:airline#extensions#bufferline#overwrite_variables = 1
  let g:airline#extensions#whitespace#enabled = 0

""* enable/disable csv integration for displaying the current column. >
  let g:airline#extensions#csv#enabled = 1

" change how columns are displayed. >
  let g:airline#extensions#csv#column_display = 'Name'


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = ''
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_sep = ''


  " cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
  " tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
  nmap <leader>t :term<cr>
  nmap <leader>, :bnext<CR>
  " tmap <leader>, <C-\><C-n>:bnext<cr>
  nmap <leader>. :bprevious<CR>
  " tmap <leader>. <C-\><C-n>:bprevious<CR>
  let g:airline#extensions#tabline#buffer_idx_mode=1
  if has ('nvim')
    tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
    tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
    tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
    tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
    tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
    tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
    tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
    tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
    tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
  endif
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
"}}}

endif