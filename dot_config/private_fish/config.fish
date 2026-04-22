if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

starship init fish | source

# Set up fzf key bindings
fzf --fish | source

export FZF_CTRL_T_OPTS="
 --style full
 --walker-skip .git,node_modules,target,.asdf
 --preview 'bat -n --color=always {}'
 --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

export FZF_CTRL_R_OPTS="
 --style full
 --walker-skip .git,node_modules,target
 --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

eval "$(zoxide init fish --cmd z)"

alias tmuxconfig="nvim ~/.tmux.conf"
alias fishconfig="nvim ~/.config/fish/config.fish"

alias ls='eza --icons --color=auto --group-directories-first'

/usr/bin/mise activate fish | source

# opencode
fish_add_path $HOME/.opencode/bin

set -gx PNPM_HOME $HOME/.local/share/pnpm
fish_add_path $PNPM_HOME
