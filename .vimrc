" Auto-Reload ~/.vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'
Plug 'troydm/pb.vim'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'joshdick/onedark.vim'
Plug 'jwalton512/vim-blade'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-endwise'

" This goes last
Plug 'ryanoasis/vim-devicons'

call plug#end()

set nocompatible					" Use Vim settings, rather then Vi settings (much better!).
set ofu=syntaxcomplete#Complete

" ================ General Config ====================
set title								" Update terminal window title
set visualbell					" Turn off sounds
set showmode						" Show the current mode
set showcmd							" Show incomplete commands
set autoread						" Reload files changed outside of vim
set ttyfast							" Use a fast terminal connection
set showtabline=2					" Always Show Tab Line
set number								" Show Line Numbers"
set hidden
let mapleader=","					" Map leader from \ to ,

" ================ Indentation =======================
set shiftwidth=2
set tabstop=2
set softtabstop=2
set wrap								" Wrap lines
set textwidth=79				" Width of text strings
set showbreak=↪
set expandtab
set list
set listchars=tab:\ \ ,trail:·,nbsp:•,eol:¬
set autoindent

" ================ Completion ========================
set wildmode=list:longest
set wildignore=*.o,*.obj,*~			"stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif,*.pdf,*.psd

" ================ Searching =========================
set ignorecase					" Ignore case when searching
set smartcase						" Don't ignore case if search contains upper-case characters
set gdefault						" Substitude command (:s) always does global search
set hlsearch						" Highlight searches by default

" ================ Mouse =============================
" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" ================ Colors ============================
" Draw a distinction between 256 color terminals and 16 color terminals
if &t_Co == 256
  if (has("autocmd") && !has("gui_running"))
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " No `bg` setting
  end

  colorscheme onedark 
  
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

  let g:airline_theme='onedark'
else
  colorscheme peachpuff

  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
endif

autocmd BufEnter * IndentGuidesEnable
let g:indent_guides_auto_colors = 0

"highlight Pmenu ctermfg=lightgrey ctermbg=234
"highlight PmenuSel ctermfg=white ctermbg=darkgrey
highlight clear SpellBad

" ================ Plugins ===========================

" airline
let g:airline_powerline_fonts = 1

" delimitMate
au FileType php let delimitMate_matchpairs = "(:),[:],{:}"

" CloseTag
autocmd FileType html,htmldjango,jinjahtml,eruby,ruby,mako let b:closetag_html_style=1

" CTags
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width = 40
let g:tagbar_type_php  = {'ctagstype' : 'php', 'kinds'     : [ 'i:interfaces', 'c:classes', 'd:constant definitions', 'f:functions' ] }

autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
autocmd BufEnter * nested :call tagbar#autoopen(0)

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['php', 'ruby'], 'passive_filetypes': ['c','h','cpp'] }

" Remember Last Position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" ================ Remapping =========================
" Navigate rows rather than lines
nnoremap <down> gj
nnoremap <up> gk

" Write/quit fixes
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Fix keycodes
imap  <Home>
imap  <End>

" Tabs
map } gt
map { gT

" Split Windows
map <leader>, <C-w>w

" Reselect visual block after indenting
vmap > > gv
vmap < < gv

" ================ PHP Settings ======================
" MySQL Highlighting Inside Strings
let php_sql_query = 1

" Highlight HTML Inside Strings
let php_htmlInStrings = 1

" ================== Ctrl+P Settings =================
let g:ctrlp_map = '<c-t>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](node_modules|bower_components|\.cache|\.git|\.hg|\.svn|\.min\.css|\.min\.js)$', 'file': '\v\.(exe|so|dll|swp)$' }
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_open_new_file = 't'
"let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'] }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" =================== NERDTree ==================
nnoremap <leader>/ :NERDTreeToggle<CR>

" =================== Custom ==================
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

