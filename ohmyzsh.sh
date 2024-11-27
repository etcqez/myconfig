sh -c "$(curl -fsSL https://install.ohmyz.sh/)"

ZSH_CUSTOM=~/.oh-my-zsh/custom
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git
sed -Ei '/^plugins=/s/\)$/ zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting\)/' ~/.zshrc
sed -Ei '/^plugins=/s/\)$/ sudo z\)/' ~/.zshrc
echo source ~/myconfig/zshrc >> ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
