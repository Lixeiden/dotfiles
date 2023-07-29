" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VUNDLE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" ~~~~~~~~~~~~~~~ PLUGINS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-bufferline'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'

" ~~~~~~~~~~~~~~~ PLUGINS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VUNDLE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plugin 'davidhalter/jedi-vim' " venv only :(
" Plugin 'fatih/vim-go' " You will also need to install all the necessary binaries. vim-go makes it easy to install all of them by providing a command, :GoInstallBinaries, which will go install all the required binaries.

"menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
"menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
"menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
"menu Encoding.utf-8 :e ++enc=utf8<CR>
"menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
"map <F8> :emenu Encoding.<TAB>

"set nocompatible

colorscheme cobalt
highlight Search ctermbg=Red

nnoremap O O<Esc>
nnoremap o o<Esc>
nnoremap gx xp

set encoding=utf-8
set hlsearch
set number
set shortmess-=S

syntax on

" Use :Rm to delete current file:
function! ConfirmAndDelete()
    if confirm("DELETE this file?", "&No\n&Yes") == 2
        execute('!rm ' . shellescape(expand('%')))
    else
        echo "Cancelled"
    endif
endfunction
command! -nargs=0 Rm call ConfirmAndDelete()
" Press \d to delete current file: 
nnoremap <leader>d :Rm<CR>

" Use :Cc to pbcopy (whole buffer):
command! Cc w !xclip -selection clipboard
" Press \c to pbcopy (whole buffer): 
nnoremap <leader>c :Cc<CR>

" Use :Cl to pbcopy (selected lines):
command! -range Cl <line1>,<line2>w !xclip -selection clipboard
" Press \c to pbcopy (selected lines): 
vmap <leader>c :Cl<CR>

" Use :Pp to paste from system clipboard:
command! Pp r !xclip -o -selection clipboard
" Press \p to paste from system clipboard:
nnoremap <leader>p :Pp<CR>

" Use :Md5 to calculate md5sum of selected lines
command! -range=% -nargs=0 Md5 <line1>,<line2>w !md5sum

nnoremap <leader>] :tabnext<CR>
nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>
nnoremap <leader>6 :tabn 6<CR>
nnoremap <leader>7 :tabn 7<CR>
nnoremap <leader>8 :tabn 8<CR>
nnoremap <leader>9 :tabn 9<CR>

nnoremap <leader>q :q<CR>

nnoremap <leader>l :set list!<CR>
nnoremap <leader>; :set listchars=tab:→\ ,space:␣<CR>

set expandtab
set tabstop=4
set shiftwidth=4

function! ToggleColorColumn()
    if &colorcolumn == ""
        let &colorcolumn = g:colorcolumn
    else
        let &colorcolumn = ""
    endif
endfunction
let g:colorcolumn = "1,5,9,13,17,21,25,29,33,37,41,45,49,53,57,61,65,69,73,77,81,85,89,93,97,101"
nnoremap <Leader>' :call ToggleColorColumn()<CR>

let g:airline#extensions#tabline#enabled = 1

nnoremap <C-Down> gj
nnoremap <C-Up> gk

set splitright
nnoremap <leader>z :vsplit \| enew \| windo diffthis<CR>
nnoremap <leader>x :windo diffoff<CR>

set cursorline
