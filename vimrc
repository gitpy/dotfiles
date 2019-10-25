" ##############################################################################
" ### Neovim Configuration                                                   ###
" ##############################################################################

" ==============================================================================
" 1.0 Plugin manager (Plug) settings {{{
" ==============================================================================

" Autoinstall {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
call plug#begin('~/.config/nvim/plugged')

" ------------------------------------------------------------------------------
" Language agnostic plugins {{{
" ------------------------------------------------------------------------------

" Language Server Protocol
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Formatter
Plug 'sbdchd/neoformat'
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Snippet support (C-j)
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" Better syntax highlighting for many languages
Plug 'sheerun/vim-polyglot'
"}}}

" ------------------------------------------------------------------------------
" Other languages {{{
" ------------------------------------------------------------------------------
Plug 'lervag/vimtex', { 'for': ['tex','bib'] }
"}}}

" ------------------------------------------------------------------------------
" Denite fuzzy searcher {{{
" ------------------------------------------------------------------------------

" Denite files, buffers, etc. sources
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" History/yank source
Plug 'Shougo/neoyank.vim'
" MRU source
Plug 'Shougo/neomru.vim'
"}}}

" ------------------------------------------------------------------------------
" Interface improving {{{
" ------------------------------------------------------------------------------

" Status line
Plug 'rbong/vim-crystalline'
" Buffers tabline
Plug 'ap/vim-buftabline'
"}}}

" ------------------------------------------------------------------------------
" External tools integration plugins {{{
" ------------------------------------------------------------------------------

" Fugitive
Plug 'tpope/vim-fugitive'
" Git log viewer (GV! for file mode)
Plug 'junegunn/gv.vim', { 'on': 'GV' }
" Git changes showed on line numbers
Plug 'mhinz/vim-signify', {'on': ['SignifyEnable','SignifyToggle']}
"}}}

" ------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ------------------------------------------------------------------------------

" Highlight jump characters on f, F, t, T
Plug 'unblevable/quick-scope'
" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Cycling related words via C-a C-x (i.e. true/false)
Plug 'zef/vim-cycle'
"}}}

" ------------------------------------------------------------------------------
" Extra text objects {{{
" ------------------------------------------------------------------------------

" Argument text object (via, >a)
Plug 'PeterRincker/vim-argumentative'
" Improved targets line cin) next parens
Plug 'wellle/targets.vim'
"}}}

" ------------------------------------------------------------------------------
" Colorschemes {{{
" ------------------------------------------------------------------------------
Plug 'rakr/vim-one'
"}}}

" ------------------------------------------------------------------------------
" Other {{{
" ------------------------------------------------------------------------------

" Easily expand selected region
Plug 'terryma/vim-expand-region'
" Search for highlighted word with *
Plug 'thinca/vim-visualstar'
" Improve star by not jumping immediately
Plug 'ironhouzi/vim-stim'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Iabbrev auto-correction library
Plug 'chip/vim-fat-finger'
" More . repeat functionality
Plug 'tpope/vim-repeat'
"}}}

call plug#end()
"}}}

" ==============================================================================
" 2.0 Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ==============================================================================

set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers on
set noshowmode                              " Always show mode
set showcmd                                 " Show commands as you type them
set textwidth=80                            " Text width is 80 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set mouse=a                                 " Enables mouse
"}}}

" ------------------------------------------------------------------------------
" 2.1 Split settings (more natural) {{{
" ------------------------------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
"}}}

" -----------------------------------------------------------------------------
" 2.2 Timeout settings {{{
" -----------------------------------------------------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" ------------------------------------------------------------------------------
" 2.3 Spelling settings {{{
" ------------------------------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default
"}}}

" ------------------------------------------------------------------------------
" 2.4 Search settings {{{
" ------------------------------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
"}}}

" ------------------------------------------------------------------------------
" 2.5 Persistent undo settings {{{
" ------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" ------------------------------------------------------------------------------
" 2.6 White characters settings {{{
" ------------------------------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪
"}}}

" ------------------------------------------------------------------------------
" 2.7 Filetype settings {{{
" ------------------------------------------------------------------------------
filetype plugin on
filetype indent on
"}}}

" ------------------------------------------------------------------------------
" 2.8 Folding settings {{{
" ------------------------------------------------------------------------------
set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators
set fillchars+="vert: "
"}}}

" ------------------------------------------------------------------------------
" 2.9 Omni completion settings {{{
" ------------------------------------------------------------------------------
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
"}}}

" ------------------------------------------------------------------------------
" 2.10 Neovim specific settings {{{
" ------------------------------------------------------------------------------
if (has("termguicolors"))
  set termguicolors
endif
"}}}

"}}}

" ==============================================================================
" 3.0 Mapping settings {{{
" ==============================================================================

" -----------------------------------------------------
" 3.1 Setting leader {{{
" -----------------------------------------------------
let g:mapleader="\<space>"
"}}}

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter {{{
" with Q key, help with F1, etc.
" -----------------------------------------------------
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>
"}}}

" -----------------------------------------------------
" 3.3 Vim defaults overriding {{{
" -----------------------------------------------------

" Easier window switching
nmap <silent> <C-w><C-w> :call IntelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Quick replay 'q' macro
nnoremap Q @q

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Terminal mode mappings
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz
"}}}

" -----------------------------------------------------
" 3.4 Common tasks {{{
" -----------------------------------------------------

" Quick save and close buffer
nnoremap ,w :w<CR>
nnoremap <silent> ,c :Sayonara!<CR>
nnoremap <silent> ,q :Sayonara<CR>

"Close all buffers
nnoremap ,C :bd<CR>

" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move line up
nnoremap <A-k> :m -2<CR>
nnoremap <A-j> :m +1<CR>

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap ,ts :ts<CR>

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap ,z za

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Faster sort
vnoremap ,s :!sort<CR>
"}}}

" -----------------------------------------------------
" 3.5 F-key actions {{{
" -----------------------------------------------------

" Toggle netrw
nnoremap <silent> <F2> :Lexplore<Cr>
" Paste mode toggling
nnoremap <silent> <F3> :set paste!<CR>:set paste?<CR>
" Toggle spelling on and off
nnoremap <silent> <F4> :set spell!<CR>:set spell?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR>:set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR>:set list?<CR>
" Echo out toggles legend on <F12>
nnoremap <F12> :call ShowToggles()<CR>
"}}}

" -----------------------------------------------------
" 3.6 Window / Buffer management {{{
" -----------------------------------------------------

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Right> :call IntelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call IntelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>
"}}}

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings {{{
" -----------------------------------------------------

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall
"}}}

" -----------------------------------------------------
" 3.8 Custom commands and functions {{{
" -----------------------------------------------------

" Open notes
command! Notes :call OpenNotes()

" Run current file
command! Run :call RunCurrentFile()
nnoremap <silent> ,r :Run<CR>

" Reformat whole or selection from file
nnoremap <silent> ,f :Neoformat<CR>
vnoremap <silent> ,f :Neoformat<CR>

" Profile
command! Profile :call Profile()

" Retab
command! Retab :call RetabToFourSpaces()
" }}}

" -----------------------------------------------------
" 3.9 German keyboard mappings {{{
" -----------------------------------------------------
map ü <C-]>
map ö [
map ä ]
map Ö {
map Ä }
map ß /
"}}}

"}}}

" ==============================================================================
" 4.0 Plugins settings {{{
" ==============================================================================

" -----------------------------------------------------
" 4.1 Language Server Protocol {{{
" -----------------------------------------------------
set hidden
let g:LanguageClient_serverCommands = {
  \ 'rust': ['rls'],
  \ 'c': ['clangd-6.0'],
  \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"}}}

" -----------------------------------------------------
" 4.2 Denite {{{
" -----------------------------------------------------

" Use ag if available
if executable('ag')
  call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif
if executable('rg')
  call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files', '--glob', '!.git'])

  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
                  \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('default', 'split', 'floating')

" Add syntax highlighting
let g:denite_source_line_enable_highlight=1

" Custom denite menus
let s:dmenus = {}

" Utils menu
let s:dmenus.utils = {
    \     'description' : 'Utility commands',
    \ }
let s:dmenus.utils.command_candidates = [
    \       ['Show notes', 'Notes'],
    \       ['Show highlight groups', 'so $VIMRUNTIME/syntax/hitest.vim'],
    \     ]

" Git menu
let s:dmenus.git = {
      \     'description' : 'Git commands',
      \ }
let s:dmenus.git.command_candidates = [
      \       ['Unstage hunk', 'SignifyHunkUndo'],
      \       ['Stage', 'Gwrite'],
      \       ['Status', 'Gstatus'],
      \       ['Diff', 'Gvdiff'],
      \       ['Commit', 'Gcommit --verbose'],
      \       ['Revert', 'Gread'],
      \       ['Log', 'Glog'],
      \       ['Visual log', 'GV'],
      \       ['Current file visual log', 'GV!'],
      \     ]

call denite#custom#var('menu', 'menus', s:dmenus)
"}}}


" -----------------------------------------------------
" 4.3 Ultisnips settings {{{
" -----------------------------------------------------
let g:UltiSnipsUsePythonVersion=3
"}}}

" -----------------------------------------------------
" 4.4 Signify settings {{{
" -----------------------------------------------------
" let g:signify_disable_by_default = 1
let g:signify_sign_show_count=0
"}}}


" -----------------------------------------------------
" 4.5 CrystalLine settings {{{
" -----------------------------------------------------
function! StatusLine(current, width)
  let l:truncate = a:width > 70
  let l:s = ''
  let l:file_description = '%w%{&modifiable && &modified?"+":""}%{&readonly?"\ RO":""} '
  let l:cursor_location = ' %p%% %l:%c '

  if !a:current
    return '%#Crystalline#' . ' %f' . l:file_description . '%=' . l:cursor_location
  endif

  let l:s .= crystalline#mode()

  let l:s .= '%#Crystalline#'
  let l:s .= '%{&paste?" PASTE":""}'
  let l:s .= ' %t' . l:file_description

  let l:s .= '%#Normal#'
  " if l:truncate && exists("*fugitive#head")
  "   let l:s .= ' %{fugitive#head()}'
  " endif

  let l:s .= '%='
  if l:truncate
    let l:s .= ' %{&filetype!=#""?&ft:"no-ft"} %{&fenc!=#""?&fenc:&enc} %{&ff} '
  endif

  let l:s .= '%#Crystalline#' . l:cursor_location

  return l:s
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'onedark'

"}}}

" -----------------------------------------------------
" 4.6 Neomake settings {{{
" -----------------------------------------------------
let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }
"}}}

" -----------------------------------------------------
" 4.7 Neoformat settings {{{
" -----------------------------------------------------
let g:neoformat_basic_format_align = 1
"}}}

" -----------------------------------------------------
" 4.8 Quick scope settings {{{
" -----------------------------------------------------
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
"}}}

" -----------------------------------------------------
" 4.9 Deoplete autocomplete settings {{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#disable_auto_complete = 1

set completeopt=noselect,menuone,longest

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\w*'
      \ .')'

call deoplete#custom#option('sources', {
      \ '_': ['buffer', 'file', 'ultisnips'],
      \'c': ['LanguageClient'],
      \'cpp': ['LanguageClient'],
      \'rust': ['LanguageClient'] })

call deoplete#custom#option('ignore_sources', {'_': ['around']})

call deoplete#custom#source('_', 'max_kind_width', 0)
call deoplete#custom#source('_', 'matchers', ['matcher_head'])
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

" call deoplete#custom#source('LanguageClient', 'sorters', [])

"}}}


" -----------------------------------------------------
" 4.10 Plug settings {{{
" -----------------------------------------------------
let g:plug_timeout=20
"}}}

" -----------------------------------------------------
" 4.11 lexima settings {{{
" -----------------------------------------------------
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})
"}}}

" -----------------------------------------------------
" 4.12 vimtex settings {{{
" -----------------------------------------------------
let g:polyglot_disabled = ['latex']
if executable('zathura')
  let g:latex_view_general_viewer = 'zathura'
  let g:vimtex_view_method = 'zathura'
else
  let g:latex_view_general_viewer = 'SumatraPDF'
  let g:vimtex_view_method = 'general'
endif
"}}}

" }}}

" ==============================================================================
" 5.0 Plugin mappings {{{
" ==============================================================================

" -----------------------------------------------------
" 5.1 Denite and extensions {{{
" -----------------------------------------------------

" Custom mappings for the denite buffer

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> <C-s> denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-j> <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-s> denite#do_map('do_action', 'split')
  inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  nmap <silent><buffer> <esc> <Plug>(denite_filter_quit)
endfunction

" Search files recursively ([o]pen file)
nnoremap <silent> <leader>o :Denite file/rec -start-filter<CR>
" Browse [f]iles in CWD
nnoremap <silent> <leader>f :Denite file<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :Denite buffer<CR>
" Search in current file ou[t]line (tags in current file)
nnoremap <silent> <leader>t :Denite tag<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <leader>l :Denite line<CR>
" Search in [y]ank history
nnoremap <silent> <leader>y :Denite neoyank<CR>
" Search in [r]egisters
nnoremap <silent> <leader>r :Denite register<CR>
" Search in ultisnips [s]nippets
"nnoremap <silent> <leader>s :Denite -buffer-name=snippets ultisnips<CR>
" Search in latest [j]ump positions
nnoremap <silent> <leader>j :Denite jump<CR>
" Search in my custom unite [m]enu with my commands
nnoremap <silent> <leader>m :Denite menu<CR>
" Seach in help menu for commands
nnoremap <silent> <leader>hc :Denite command<CR>
"}}}

" -----------------------------------------------------
" 5.2 Ultisnips {{{
" -----------------------------------------------------
" Disable built-in cx-ck to be able to go backward
inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
"}}}

" -----------------------------------------------------
" 5.3 Signify {{{
" -----------------------------------------------------
nmap [h <plug>(signify-prev-hunk)
nmap ]h <plug>(signify-next-hunk)
nnoremap ,hr :SignifyHunkUndo<CR>
"}}}

" -----------------------------------------------------
" 5.4 Expand region {{{
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}

" -----------------------------------------------------
" 5.5 Argumentative (use a instead of ,) {{{
" -----------------------------------------------------
xmap ia <Plug>Argumentative_InnerTextObject
xmap aa <Plug>Argumentative_OuterTextObject
omap ia <Plug>Argumentative_OpPendingInnerTextObject
omap aa <Plug>Argumentative_OpPendingOuterTextObject
nmap [a <Plug>Argumentative_Prev
nmap ]a <Plug>Argumentative_Next
xmap [a <Plug>Argumentative_XPrev
xmap ]a <Plug>Argumentative_XNext
nmap <a <Plug>Argumentative_MoveLeft
nmap >a <Plug>Argumentative_MoveRight
"}}}

" -----------------------------------------------------
" 5.6 Deoplete autocomplete {{{
" -----------------------------------------------------
" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> "<C-R>=TabComplete()<CR>"

inoremap <silent><expr><C-Space> deoplete#manual_complete()

if has("unix")
  imap <C-@> <C-Space>
endif

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
"}}}

" -----------------------------------------------------
" 5.7 Fugitive {{{
" -----------------------------------------------------
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit --verbose<CR>
"}}}

"}}}

" -----------------------------------------------------
" 5.9 GV {{{
" -----------------------------------------------------
nnoremap <leader>gh :GV!<CR>
"}}}

"}}}

" ==============================================================================
" 6.0 Color and highlighting settings {{{
" ==============================================================================

" Syntax highlighting {{{
syntax on
"}}}

" Color scheme {{{
set background=dark
colorscheme one

"}}}

" Highlight VCS conflict markers {{{
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

" Make Split Line Invisible {{{
" hi! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE guifg=NONE
"}}}

"}}}

" ==============================================================================
" 7.0 Autocommands {{{
" ==============================================================================

" Keywordprg settings {{{
autocmd FileType vim setlocal keywordprg=:help
"}}}

" Turn spellcheck on for text files {{{
autocmd BufNewFile,BufRead *.md setlocal spell
autocmd BufNewFile,BufRead *.tex setlocal spell
"}}}

" Remove trailing whitespaces automatically before save {{{
autocmd BufWritePre * call StripTrailingWhitespaces()
"}}}

" Resize splits when the window is resized {{{
autocmd VimResized * :wincmd =
"}}}

" Make sure Vim returns to the same line when you reopen a file. {{{
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}

" Auto reload config {{{
autocmd! BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim nested so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"}}}

" -----------------------------------------------------
" 7.1 Run linters after save {{{
" -----------------------------------------------------
autocmd BufWritePost *.js Neomake eslint
autocmd BufWritePost *.json Neomake jsonlint
autocmd BufWritePost *.html Neomake tidy
autocmd BufWritePost *.md Neomake mdl
autocmd BufWritePost *.sh Neomake shellcheck
autocmd BufWritePost *.vim Neomake vint
autocmd BufWritePost *.{c,h} Neomake clang
autocmd BufWritePost *.cpp Neomake clang
autocmd BufWritepost *.rs Neomake rustc
autocmd BufWritepost *.tex Neomake chktex lacheck
autocmd BufWritepost *.py flake8
"}}}

" ==============================================================================
" 8.0 Functions {{{
" ==============================================================================

" Informative echo line
function! ShowToggles() abort
  echom '<F1> free | <F2> netrw | <F3> Paste mode | <F4> Spellcheck | <F5> Reload rc | <F6> Search HL |' .
        \' <F7> Whitechars | <F12> This message'
endfunction

" Profile neovim and save results to profile.log
function! Profile() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
  echom 'Profiling started (will last until you quit neovim).'
endfunction

" When cycling ignore netrw
function! IntelligentCycling() abort
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &filetype ==# 'netrw'
    call IntelligentCycling()
  endif
  " If in terminal buffer start insert
  if &buftype ==# 'terminal'
    startinsert!
  endif
endfunction

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.
function! IntelligentVerticalResize(direction) abort
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

" Run current file
function! RunCurrentFile() abort
  if &filetype ==? 'ruby'
    let l:command = 'ruby %'
  elseif &filetype ==? 'sh'
    let l:command = 'sh %'
  else
    echom "Can't run current file (unsupported filetype: " . &filetype . ')'
  endif

  if exists('command')
    execute ':terminal ' . l:command
  endif
endfunction

" Strip trailing spaces
function! StripTrailingWhitespaces() abort
  " Preparation: save last search, and cursor position.
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  " Do the business:
  execute '%s/\s\+$//e'

  " Clean up: restore previous search history, and cursor position
  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" Set US keyboard layout with qwerty
function! SetUSKBLayout() abort
  silent !setxkbmap us
endfunction

" Tab wrapper
function! TabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    " if !l:col || getline('.')[l:col - 1] !~# '\k'
    if !l:col || getline('.')[l:col - 1] =~ '\s'
      return "\<TAB>"
    else
      let snippet = UltiSnips#ExpandSnippetOrJump()
      if g:ulti_expand_or_jump_res
        return snippet
      else
        return deoplete#manual_complete()
    endif
  endif
endfunction

" Simple notes management
function! OpenNotes() abort
  execute ':e ~/dev/notes/vim-notes.md'
endfunction

" Use omni complete source as default
function! UseOmniTabWrapper() abort
  inoremap <buffer> <expr> <TAB> InsertTabOmniWrapper()
endfunction

" Reset tabs to 4 spaces
function! RetabToFourSpaces() abort
  setlocal tabstop=4 shiftwidth=4 expandtab
  retab
endfunction

"}}}
