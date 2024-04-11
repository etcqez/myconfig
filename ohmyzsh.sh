#sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
#ZSH_CUSTOM=~/.oh-my-zsh/custom
#git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
#git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
#sed -Ei '/^plugins=/s/\)$/ zsh-autosuggestions zsh-syntax-highlighting\)/' ~/.zshrc

sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting
cat >> ~/.zshrc <<EOF
# myconf########################################################################
echo source ~/myconfig/zshalias >> ~/.zshrc
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF
