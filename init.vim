" DO NOT EDIT THIS FILE
" Add your own customizations in ~/.config/my_configs.vim

set runtimepath+=~/.config

source ~/.config/nvim/vimrcs/basic.vim
source ~/.config/nvim/vimrcs/filetypes.vim
source ~/.config/nvim/vimrcs/plugins_config.vim
source ~/.config/nvim/vimrcs/extended.vim
try
  source ~/.config/nvim/my_configs.vim
catch
endtry
