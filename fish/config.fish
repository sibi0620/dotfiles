alias update='sudo xbps-install -Suy'
alias install='sudo xbps-install -S'
alias search='xbps-query -Rs'
alias remove='sudo xbps-remove'
alias orp_remove='sudo xbps-remove -O'
alias ca_remove='sudo xbps-remove -o'
alias c='clear'
alias ls='ls -lh --color=auto'
alias als='ls -alh --color=auto'
alias fconf='vim ~/.config/fish/config.fish'
alias fload='source ~/.config/fish/config.fish'
alias reb='sudo reboot'
alias shut='sudo poweroff'

# Coimpilers:
#alias odin='~/odin/odin'

if status is-interactive
# Commands to run in interactive sessions can go here
end

# --- SSH Agent Automation ---
if not set -q SSH_AUTH_SOCK
    # Start the agent and save the output to a temporary file
    set -l agent_env (ssh-agent -c | string collect)
    eval $agent_env
    
    # Export variables globally so subshells can see them
    set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -gx SSH_AGENT_PID $SSH_AGENT_PID
end

# Automatically add your key if it's not already in the agent
# The 2>/dev/null hides the "The agent has no identities" message
if not ssh-add -l > /dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519
end

set -g fish_greeting ''
