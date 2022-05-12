require 'rake'
require 'fileutils'

desc "Install Dotfiles"
task :install do
  puts
  puts "======================================================"
  puts "Welcome to Dotfiles Installation."
  puts "======================================================"
  puts
  
  install_homebrew if RUBY_PLATFORM.downcase.include?("darwin")

  # this has all the runcoms from this directory.
  install_file('tmux.config')
  install_file('zshrc')
  install_file('vimrc')
  
  puts "======================================================"
  puts "Creating directory for undodir vim plugin"
  puts "======================================================"
  run %{mkdir -p ~/.vim/undodir}
  
  puts "======================================================"
  puts "Installing vim-plug"
  puts "======================================================"
  run %{curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim}
  
  puts "======================================================"
  puts "Installing Vim plugins"
  puts "======================================================"
  run %{vim +'PlugInstall --sync' +qa}
  
  puts "======================================================"
  puts "Adding coc-settings on vim"
  puts "======================================================"
  run %{ln -sfn ~/.dotfiles/coc-settings.json ~/.vim/coc-settings.json}

  success_msg("installed")
end

desc 'Updates the installation'
task :update do
  Rake::Task["install"].execute
end

task :default => 'install'

private
def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    puts "======================================================"
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts "already installed, this will do nothing."
    puts "======================================================"
    run %{/bin/bash -c -Y "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"}
  end

  puts
  puts
  puts "======================================================"
  puts "Updating Homebrew."
  puts "======================================================"
  run %{brew update}
  puts
  puts
  puts "======================================================"
  puts "Installing Homebrew packages...There may be some warnings."
  puts "======================================================"
  run %{brew install zsh ctags git tmux python3 fzf autojump ripgrep xclip}
  puts
  puts
end

def install_file(file, method = :symlink)
  source = "#{ENV["PWD"]}/.#{file}"
  target = "#{ENV["HOME"]}/.#{file}"

  puts "======================#{file}=============================="
  puts "Source: #{source}"
  puts "Target: #{target}"

  if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
    puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
    run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
  end

  if method == :symlink
    run %{ ln -nfs "#{source}" "#{target}" }
  else
    run %{ cp -f "#{source}" "#{target}" }
  end

  puts "=========================================================="
  puts
end

def success_msg(action)
  puts "===================================================================="
  puts ""
  puts "Dotfiles has been #{action}. Please restart your terminal and vim."
  puts ""
  puts "===================================================================="
end
