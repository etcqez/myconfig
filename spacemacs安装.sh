set -ue
[[ -d ~/.emacs.d ]] && rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
git clone --depth 1 git@github.com:etcqez/.spacemacs.d.git $HOME/.spacemacs.d

