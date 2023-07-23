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
