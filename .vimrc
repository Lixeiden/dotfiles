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
    if confirm("DELETE this file?", "&Yes\n&No") == 1
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

" Use :Md5 to calculate md5sum of selected lines
command! -range=% -nargs=0 Md5 <line1>,<line2>w !md5sum
