" This is my init.vim file, which is (effectively) a .vimrc file for Neovim.
" Presently I keep it in $XDG_CONFIG_HOME/nvim/init.vim which is a convention
" I'm still getting use to. Neovim has proven to be generally more spiffy than
" Vim so I'm continuing to endulge these quirks.

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

let g:python_host_prog = '/usr/local/Cellar/python/2.7.11/bin/python'

execute pathogen#infect()

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Use comma as leader key.
let mapleader=","

" Remap ruby compiler to comma R.
map <leader>r :!ruby %<cr>

" Automatically close VIM if NERDTree is the only window remaining.
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Resolving the buffer nonsense of clipboards.
set clipboard=unnamed

" Set tab witdh to 2 spaces as opposed to 8 (the default).
set tabstop=2

" Don't create a swap file (disabling as of 2016.12.10 as Neovim seems to not
" clean up swap files. :/)
set noswapfile

" JJ == GG! lololol
:imap jj <Esc>

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" In case I feel old school.
" colorscheme desert

