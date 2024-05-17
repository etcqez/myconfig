# pyenv
# pyenv install -l | less
# pyenv virtualenv 3.9.9 v399
# pyenv local v399
# pyenv version
# pyenv versions
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
