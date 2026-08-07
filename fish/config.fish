# Remove the fish greeting
set -g fish_greeting

# Start the ssh-agent if not already active
if not set -q SSH_AUTH_SOCK
	eval (ssh-agent -c) > /dev/null
end

# GPG
set -gx GPG_TTY (tty)

# XDG_CONFIG_PATH for ghostty config
set -x XDG_CONFIG_HOME $HOME/.config

# Aliases
alias ls='eza --icons --all'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
