GIT_REPO=git@github.com:etcqez/.vim.git
[ -e ~/.vim ] && rm -rf ~/.vim
[ -e ~/.emacs.d ] && rm -rf ~/.emacs.d
[ -e ~/.config/nvim ] && rm -rf ~/.config/nvim
git clone --depth 1 $GIT_REPO  ~/.vim
git clone --depth 1 $GIT_REPO  ~/.emacs.d
git clone --depth 1 $GIT_REPO  ~/.config/nvim
