syntax enable " Turn on syntax highlighting
set number " Enable line number
set tabstop=4 " Enable proper tabs
set history=100 " Command history
set autoindent " Auto indent a new line

" Map Ctrl+n to open Nerd Tree
map <C-t> :NERDTreeToggle<CR>

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//
