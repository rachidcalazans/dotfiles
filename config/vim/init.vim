let s:config_path = $HOME.'/.vim/config/vim/'
let s:config_files = [
      \'plugins.vim',
      \'functions.vim',
      \'common.vim',
      \'maps.vim',
      \]

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

for file in s:config_files
  if filereadable(s:config_path.file)
    exec "so ".s:config_path.file
  endif
endfor