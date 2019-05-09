set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
Plugin 'dracula/vim'
"
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



set nocompatible

" general settings
syntax enable
set ruler
set showcmd
set showmatch
set nowrap
set hidden
set hlsearch
set incsearch
set clipboard=unnamed
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set backspace=indent,eol,start

" line numbering
set number
set relativenumber
autocmd InsertEnter,InsertLeave * :set invrelativenumber

" color scheme
set t_Co=256
colorscheme dracula
colorscheme elflord
set colorcolumn=81,101
highlight ColorColumn ctermbg=236
highlight SignColumn cterm=NONE ctermbg=NONE

" mappings
let mapleader=' '
nnoremap Q <nop>
nnoremap q: <nop>
"nnoremap n nzz
"nnoremap N Nzz
nnoremap <leader>p :set invpaste<cr>
nnoremap <leader>q :bd<cr>
nnoremap <c-j> :bp<cr>
nnoremap <c-k> :bn<cr>
inoremap <c-j> <esc>:bp<cr>
inoremap <c-k> <esc>:bn<cr>
vnoremap <c-j> <esc>:bp<cr>
vnoremap <c-k> <esc>:bn<cr>

" vim-multiple-cursors
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_quit_key='<Esc>'

" ag.vim
"let g:ag_prg="${ETSYWEB_DIR} --vimgrep" 
let g:ag_working_path_mode="r"

" ctrl p
let g:ctrlp_max_files=50000
let g:ctrlp_max_depth=40
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" gitgutter
let g:gitgutter_async = 0

"slime
let g:slime_target="tmux"

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map f <Plug>(easymotion-sn)

" tcomment
nnoremap <silent> <leader>x :TComment<cr>
vnoremap <silent> <leader>x :TComment<cr>

" fzf
cnoreabbrev fzf FZF
nnoremap <silent> <leader>l :Lines<cr>
nnoremap <silent> <leader>d :GFiles<cr>
"nnoremap <silent> <leader>c :BCommits<cr>

" easytags
:autocmd FileType python let b:easytags_auto_highlight = 0

" ale
let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   '.*some/folder/.*\.js$': {'ale_enabled': 0},
\}
let g:ale_set_balloons = 0
let g:ale_set_highlights = 0
let g:ale_sign_error = '✘❯'
let g:ale_sign_warning = '▲❯'
let g:ale_sign_style_error = '✘❯'
let g:ale_sign_style_warning = '▲❯'
highlight ALEErrorSign ctermfg=0 ctermbg=9
highlight ALEWarningSign ctermfg=0 ctermbg=11
highlight ALEStyleErrorSign ctermfg=0 ctermbg=9
highlight ALEStyleWarningSign ctermfg=0 ctermbg=11

" linters/fixers/ignores
nmap <leader>ap <Plug>(ale_previous_wrap)
nmap <leader>an <Plug>(ale_next_wrap)
nmap <leader>at :ALEToggle
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_linters = {
\     'javascript': ['eslint'],
\     'php': ['phpcs'],
\     'bash': ['shellcheck'],
\     'zsh': ['shellcheck'],
\     'sh': ['shellcheck']
\   }
let g:ale_fixers = {
\     'javascript': ['prettier']
\   }
let g:ale_pattern_options = {
\     '\.min\.js$': { 'ale_linters': [], 'ale_fixers': [] },
\     '\.min\.css$': { 'ale_linters': [], 'ale_fixers': [] }
\   }
let g:ale_sh_shellcheck_exclusions = 'SC2148'
let g:ale_php_phpcs_standard =
\     expand($HOME) . '/development/Etsyweb/tests/standards/stable-ruleset.xml'
" bufferline
set showtabline=2
let g:bufferline_echo = 0
let g:bufferline_show_bufnr = 0
let g:bufferline_modified = '✱'
let g:bufferline_active_buffer_left = '❮'
let g:bufferline_active_buffer_right =  '❯'

" lightline
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set laststatus=2

" auto update ctags
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()
