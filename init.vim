" Plugins.
call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons' " Always has to be loaded last according to their docs.
call plug#end()

" neovim.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Don't add comment prefix when you hit enter.
let mapleader = ","
nnoremap <CR> :noh<CR><CR> " Remove highlighting on pressing enter.

set expandtab
set hidden
set mouse=a
set number
set shiftwidth=4   " Number of spaces to use for autoindent.
set softtabstop=4  " Number of spaces in tab when editing.
set tabstop=4      " Number of visual spaces per tab.
set termguicolors  " Enable true colors if available.

if exists('&inccommand')
  set inccommand=split " Preview window for substitutions.
endif

" base16-vim.
colorscheme base16-tomorrow-night

" CoC.
source ~/.config/nvim/coc.vim

" fzf.
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Quit NERDTree if last buffer is exited.
let NERDTreeShowHidden=1 " Show hidden files and folders.
nmap <leader>ne :NERDTreeToggle<CR>

" YML.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
