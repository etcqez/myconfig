[ -e ~/.vim ] && rm -rf ~/.vim
[ -e ~/.emacs.d ] && rm -rf ~/.emacs.d
[ -e ~/.config/nvim ] && rm -rf ~/.config/nvim
git clone --depth 1 git@github.com:etcqez/.vim.git ~/.vim
git clone --depth 1 git@github.com:etcqez/.emacs.d.git ~/.emacs.d
git clone --depth 1 git@github.com:etcqez/nvim.git ~/.config/nvim
