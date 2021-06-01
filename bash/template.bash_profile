export PATH=/usr/local/Cellar/gcc/8.2.0/bin:$PATH
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/Applications/Mozart2.app/Contents/Resources/bin/"
export PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb/bin:$PATH"

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[31;1m\]\W\$(__git_ps1)\[\033[m\]\$ "
export LSCOLORS=Exfxcxdxbxegedabagacad

export LC_ALL=en_US.UTF-8

if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

  set -o vi

alias ls="ls -GF"
alias l="ls" 
alias lsd='lsd --icon never'
alias cdgr="cd $(git rev-parse --show-toplevel)"
alias cal='gcal --starting-day=1'
test -e ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash || true
