[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(jump shell zsh)"
eval "$(starship init zsh)"
alias dev="paligo-dev"
alias bdev="/Users/oliversegell/repos/backendlocal/backend.sh"
alias cli="~/go/bin/paligo-cli"
alias cli-115="~/go/bin/paligo-cli-115"
alias l="eza -la --hyperlink"
alias lt="eza --hyperlink --tree"
alias lg="lazygit"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
