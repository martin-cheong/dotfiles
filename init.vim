" vim
set autoindent              " Indent a new line the same amount as the line just typed
set expandtab               " Converts tabs to white space
set hlsearch                " Highlight search results
set ignorecase
set mouse=av                " Middle-click paste with mouse, and scrolling with scroll wheel
set nocompatible            " Disable compatibility to old-time vi
set number                  " Add line numbers
set shiftwidth=4            " Width for autoindents
set showmatch               " Show matching brackets
set smartcase
set softtabstop=4           " See multiple spaces as tabstops so <BS> does the right thing
set tabstop=4               " Number of columns occupied by a tab character
set wildmode=longest,list   " Get bash-like tab completions

filetype indent plugin on
let g:is_bash=1
set hidden
set updatetime=750
nnoremap <CR> :noh<CR><CR>

" neovim
if exists('&inccommand')
  set inccommand=split
endif

" Dockerfile
autocmd BufReadPost Dockerfile* set ft=Dockerfile

" JSON
autocmd BufNewFile,BufReadPost *.ldjson :set syntax=json
:command! PPJSON :% !jq --indent 4 '.'

" YAML indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'vim-python/python-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'glench/vim-jinja2-syntax'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Ag
let s:ag_options = ' --hidden --ignore .git '
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, s:ag_options, {'options': '--delimiter : --nth 4..'}, <bang>0) " Don't search file names

" ALE
let g:ale_fixers = [ 'eslint', 'pylint' ]
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_list_window_size = 5
let g:ale_open_list = 1
let mapleader = ","
nnoremap <leader>alel :ALELint<CR>
nnoremap <leader>aler :ALEReset<CR>

" Colours
colorscheme base16-tomorrow-night
" Comment out this line in base16-vim:
" call <sid>hi("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
set background=dark

" fzf
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

let mapleader = ","
nnoremap <leader>a :call FZFOpen(':Ag')<CR>
nnoremap <leader>h :call FZFOpen(':History')<CR>
nnoremap <leader>b :call FZFOpen(':Buffers')<CR>
nnoremap <leader>f :call FZFOpen(':GFiles')<CR>

" NERDCommenter
let g:NERDDefaultAlign = 'left'

" NERDTree
let NERDSpaceDelims=1 " Add a space after the comment symbol
let NERDTreeShowHidden=1 " Show hidden files and folders
let mapleader = ","
nmap <leader>ne :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Quit NERDTree if last buffer is exited
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Don't add comment prefix when you hit enter

" python-syntax
let g:python_highlight_all = 1

" vim-airline
let g:airline#extensions#branch#enabled = 0
