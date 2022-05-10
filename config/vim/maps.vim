let mapleader = " "
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

let g:netrw_browse_split = 2
let g:netrw_banner       = 0
let g:netrw_winsize      = 25
let g:netrw_localrmdir='rm -r'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let test#strategy = 'vimterminal'
let test#swift#swiftpm#file_pattern = 'Tests\.swift'
" let test#swift#swiftpm#executable = "xcodebuild test -scheme to-do-list -workspace to-do-list.xcworkspace -destination 'platform=iOS Simulator,name=iPhone 11,OS=14.4' -only-testing to-do-listUITests/to_do_listUITests | xcpretty --test --color"
let test#swift#swiftpm#executable = "xcodebuild test -scheme to-do-list -workspace to-do-list.xcworkspace -destination 'platform=iOS Simulator,name=iPhone 11,OS=14.4'"
" let test#ruby#rspec#executable = "bundle exec rspec"

" ================
" Todo Bujo
" ===============
let g:bujo#window_width   = 50
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
nmap <Leader>tc <Plug>BujoChecknormal
nmap <Leader>ta o<Esc><Plug>BujoAddnormal
nmap <Leader>tp :Todo<CR>
nmap <Leader>tg :Todo g<CR>


" ================
" Test Commands
" ===============
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tdn :TestNearest -fd<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>tdf :TestFile -fd<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tdl :TestLast -fd<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>

" ==========
" Auto close
" ==========
" ino " ""<left>
" ino ' ''<left>
" ino ( ()<left>
" ino [ []<left>
" ino { {}<left>
ino {<CR> {<CR>}<ESC>O

" ================
" RuboCop Commands
" ===============
nnoremap <silent> <leader>r :RuboCop<CR>
nnoremap <silent> <leader>rl :RuboCop -l<CR>
nnoremap <silent> <leader>ra :RuboCop -a<CR>

" ================
" Rails Commands
" ===============
" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using
imap <silent> <C-J> <%  %><Esc>2hi
:abbr pry require 'pry'; binding.pry<ESC>
:abbr bre require 'debug'; binding.break<ESC>

" RSpec abbr's
:abbr desc describe '' do<CR><ESC>BB
:abbr cont context '' do<CR><ESC>BB
:abbr iti it '' do<CR><ESC>BB
:abbr itii it { expect(1).to be==1 }<ESC>
:abbr let let(:) {}<ESC>02wl
:abbr before before do<CR><ESC>
:abbr allow allow().to receive(:)<ESC>0ww
:abbr expec expect().to be<ESC>0ww

" ================
" Git Commands
" ===============
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>gap :Git add -p<CR>
nnoremap <leader>gcm :Git commit -s<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gco :Git checkout
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gfa :Git fetch --all<CR>
" vim-fugitive
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

" ================
" Search Commands
" ===============
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" Search the cursor word as /{word}
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>

nnoremap <silent><leader>bu :Buffers <CR>

" ================
" Window Commands
" ===============
nnoremap vv :vsp<CR>
nnoremap ss :sp<CR>
" Moves a visual block
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>50 :vertical resize 50<CR>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>wa :wa<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <leader>u :UndotreeShow<CR>

" ================
" Clipboard Commands
" ===============
" nnoremap <leader>cc :'<,'>w !xclip -selection clipboard<CR>
" vnoremap <leader>cc :'<,'>w !xclip -selection clipboard<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" ================
" Tree Commands
" ===============
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <leader>pc :NERDTreeFind<CR>
 " It's necessary run to install :CocInstall coc-explorer
let g:coc_global_extensions = ['coc-explorer', 'coc-solargraph']
nmap <C-\> :CocCommand explorer --width 80<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <Leader>pf :Files<CR>

" To open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree


" CoC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" Search doc on Dash app
nnoremap <silent> K :Dash!<CR>

" Coc autocomplete remap
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

augroup CHID
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

autocmd VimEnter * source ~/.vimrc