" Note: Often commented out settings were "sane settings" included with the
" plugin documentation.

call plug#begin('~/.vim/plugged')

" GIT
    Plug 'tpope/vim-fugitive' " Git wrapper

    " Currently disabled because of some weird bug on startup
    " Plug 'airblade/vim-gitgutter' " Git diff sidebar markers
        " set g:gitgutter_log=1

" EDITING HELP
    
    Plug 'MaxwellBo/neoreader'
    let g:enable_at_startup = 0
    let g:speak_keypresses = 0
    let g:speak_mode_transitions = 0
    let g:interpret_generic_infix = 1
    let g:auto_speak_line = 0
    nnoremap <Leader>q :SpeakLine<cr>
    nnoremap <Leader>w :SpeakLineDetail<cr>
    nnoremap <Leader>e :SpeakLineExplain<cr>
    vnoremap <Leader>a :SpeakRange<cr>
    vnoremap <Leader>s :SpeakRangeDetail<cr>
    vnoremap <Leader>d :SpeakRangeExplain<cr>

    Plug 'kshenoy/vim-signature' " Put markers in sidebar

    Plug 'ap/vim-css-color' " Hex code colour highlighting (fast fork)

    " Plug 'rstacruz/sparkup', {'rtp': 'vim/'} " HTML tag expansion

    Plug 'Raimondi/delimitMate' " Auto close brackets

    Plug 'easymotion/vim-easymotion' " Fast jumping

    Plug 'terryma/vim-multiple-cursors' " `<C-n>` TODO: Make this <C-d>

    Plug 'tomtom/tcomment_vim' " Comment highlighted with `gc`
    " or commentary.vim

    Plug 'tommcdo/vim-exchange' " Exchange lines with `cx`, and 'X' in visual mode

    Plug 'tpope/vim-surround' " Replace surroundings with cs(from)(to), delete surroundings with ds(char), add surroundings with y(object)(char)
    " Plug 'tpope/vim-repeat'
    
    Plug 'godlygeek/tabular' " :Tab/<character to align on>

" WORKFLOW SUPPORT
    " Plug 'cloudhead/neovim-fuzzy' " Fast file open
    "     nnoremap <C-p> :FuzzyOpen<CR>

    Plug 'srstevenson/vim-picker'
        nnoremap <C-p> :PickerTabedit<CR>

    Plug 'airblade/vim-rooter' " Autoset working directory in the presence of project files

    " Plug 'ctrlpvim/ctrlp.vim' " Fast file open
    "     let g:ctrlp_match_window = 'bottom,order:ttb'
    "     let g:ctrlp_switch_buffer = 0
    "     let g:ctrlp_working_path_mode = 0

    Plug 'scrooloose/nerdtree' " File navigation sidebar
        map <C-b> :NERDTreeToggle<CR>
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" APPEARANCE
    Plug 'mhinz/vim-startify' " Nice startup screen

    " Plug 'bling/vim-airline' " Nice status bar
    "     set noshowmode
    "     let g:airline_powerline_fonts = 1
        " set guifont=Liberation\ Mono\ for\ Powerline\ 10
    Plug 'itchyny/lightline.vim'
    " let g:lightline = {
    "       \ 'colorscheme': 'wombat',
    "       \ }

    " Plug 'Yggdroot/indentLine' " Indent flagging 
        " let g:indentLine_char = '·'
    
    " Plug 'noahfrederick/vim-noctu' " Terminal dependent schemes
    " Plug 'zeis/vim-kolor'

    Plug 'morhetz/gruvbox' " The One True Scheme

    " Plug 'NLKNguyen/papercolor-theme'
    " Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
    " Plug 'endel/vim-github-colorscheme'

" SYNTAX / LINTING
    Plug 'sheerun/vim-polyglot'

    " Plug 'benekastah/neomake'

    Plug 'tpope/vim-sleuth'
        set tabstop=4
        " set softtabstop=4
        " set shiftwidth=4
        " set expandtab
        "
    Plug 'derekwyatt/vim-scala'
    Plug 'marconilanna/REPLesent', {'rtp': 'vim/'}
    
" COMPLETION
    " Plug 'ervandew/supertab'
        " let g:SuperTabDefaultCompletionType = "<c-n>"
        " imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
        " ^ Accepts highlighted option on Enter, rather than inserting newline
        " inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

    " Plug 'Valloric/YouCompleteMe' ", { 'for': ['c', 'cpp'] }
        " Plug 'rdnetto/YCM-Generator'
    
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " let g:deoplete#enable_at_startup = 1
        " let g:python3_host_prog = "/usr/local/bin/python3"


" VIM COMPATABILITY
    if !has('nvim')
        Plug 'tpope/vim-sensible'
    endif

call plug#end()

" VIM COMPATABILITY
    if has('nvim')
        set listchars=tab:——,eol:¬,space:·
        " set listchars+=space:·,trail:~,extends:>,precedes:<
    endif

    if has('nvim-0.1.5')        " True color in neovim wasn't added until 0.1.5
        set termguicolors
        " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if !has('nvim')
        set t_Co=256
    endif

" SEARCHING
    set ignorecase

" BELL (this mutes it)
    set visualbell
    set t_vb=

" APPEARANCE
    set number " line numbers
    set cursorline
    set showcmd
    set wildmode=full
    set colorcolumn=79

    " You don't know what you're missing if you don't use this.
    nmap <C-e> :e#<CR>

" BUFFER SETTINGS
    set hidden
    set splitbelow
    set splitright
    set clipboard+=unnamed " yank to system clipboard
    set mouse=a " (a)ll modes
    set autoread " only triggers if the buffer is clean compared to filesystem

" COLORSCHEME SETTINGS
    colorscheme gruvbox
    set background=dark
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_contrast_light='hard'
    highlight VertSplit cterm=none gui=none
    set fillchars+=vert:\ 
    " highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
    "
