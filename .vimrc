set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmtlib'
Plugin 'google/vim-codefmt'

""let custom_formatter = { ... }
""call codefmtlib#AddFormatter({custom_formatter})

" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
""call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
""Glaive codefmt plugin[mappings]
set expandtab
set tabstop=2

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
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
set t_Co=256
syntax on
set background=dark
" colorscheme distinguished
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1

"" sudo apt-get update && sudo apt-get install cmake build-essential python2.7-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
"" Gave up due to ....
" CMake Error at ycm/CMakeLists.txt:59 (message):
"   No pre-built Clang 3.5 binaries for 32 bit linux.  You'll have to compile
"     Clang 3.5 from source.  See the YCM docs for details on how to use a
"       user-compiled libclang.
Plugin 'Valloric/YouCompleteMe'
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"set completeopt-=preview
"Plugin 'marijnh/tern_for_vim'


"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_eslint_exec
"" 26/1/17 let g:syntastic_javascript_checkers = ['eslint']
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
"map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType vue noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
autocmd FileType javascript set formatprg=prettier\ --stdin

set autoread

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" sudo npm install jshint -g
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-A>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

autocmd Filetype html :UltiSnipsAddFiletypes html
autocmd Filetype javascript :UltiSnipsAddFiletypes javascript 

" assuming you want to use snipmate snippet engine
""""" not working ActivateAddons vim-snippets snipmate

Plugin 'jaxbot/semantic-highlight.vim'

Plugin 'nelstrom/vim-visual-star-search.git'
Plugin 'tpope/vim-unimpaired.git'

Plugin 'sjl/gundo.vim.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'vim-scripts/hexHighlight.vim.git'

set number

nnoremap <F5> :GundoToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :setlocal spell spelllang=en_gb<CR>
nmap <c-l> :tabfind 

Plugin 'bling/vim-airline.git'
set laststatus=2

Plugin 'xolox/vim-misc.git'
Plugin 'xolox/vim-easytags.git'

Plugin 'tpope/vim-surround.git'

set hlsearch
nnoremap <F12> i
nnoremap <c-i> i

" typescript "
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'clausreinke/typescript-tools.vim'
autocmd FileType typescript :set makeprg=tsc 
augroup filetypedetect
    au! BufRead,BufNewFile *.ts setfiletype typescript 
augroup END
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"

Plugin 'isRuslan/vim-es6'
Plugin 'Shougo/vimproc.vim'

Plugin 'elmcast/elm-vim'
let g:ycm_semantic_triggers = {  'elm' : ['.'], }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1

" https://www.youtube.com/watch?v=XA2WjJbmmoM&list=WL&index=68
set path+=**
set wildmenu
command! MakeTags !ctags -R .
Plugin 'benmills/vimux'
nnoremap <c-k> :bprevious<CR>
nnoremap <c-j> :bnext<CR>
nnoremap <c-Down> :ls<CR>

" 26/1/17 typescript linting....
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_typescript_tslint_args = "--config ~/work/tardigrade-ck/tslint.json"
Plugin 'Quramy/vim-js-pretty-template'
"autocmd FileType typescript JsPreTmpl html
"autocmd FileType typescript syn clear foldBraces

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

Plugin 'Chiel92/vim-autoformat'
" NOT NEEDED? let g:formatterpath = ['/usr/share/node/bin/tsfmt']
let g:formatters_typescript = ['tsfmt']
map <c-f> :Autoformat<CR>

Plugin 'wesQ3/vim-windowswap'
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>"

Plugin 'posva/vim-vue'

set clipboard=unnamedplus
