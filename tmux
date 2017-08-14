set-window-option -gq utf8 on

# make tmux display things in 256 colors
set -g default-terminal "screen-256color"

set-option -g prefix C-z
unbind C-b
bind C-z send-prefix

#bind-key C-a last-window
bind-key ` last-window
#bind-key a send-prefix

# we might need ` at some point, allow switching
# we can also send the prefix char with `-a
#bind-key F11 set-option -g prefix C-a
#bind-key F12 set-option -g prefix `

# 0 is too far from ` ;)
#set -g base-index 1

# set-option -g default-terminal "screen-256color"
set-option -g mouse on
set-option -g status-keys emacs
set-option -g bell-action any
set-option -g set-titles on
set-option -g set-titles-string '#H:#S.#I.#P #W #T' # window number,program name,active (or not)
set-option -g visual-bell on

setw -g mode-keys emacs
setw -g monitor-activity on

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# keybindings to make resizing easier
bind -r C-h resize-pane -L
bind -r C-j resize-pane -D
bind -r C-k resize-pane -U
bind -r C-l resize-pane -R

# Super-quick shortcut for previous window
bind-key z select-pane -l

# set-option -g status-justify centre
set-option -g status-justify left
set-option -g status-bg black
set-option -g status-fg white
set-option -g status-left-length 40

set-option -g pane-active-border-fg green
set-option -g pane-active-border-bg black
set-option -g pane-border-fg white
set-option -g pane-border-bg black

set-option -g message-fg black
set-option -g message-bg green

set -g base-index 1
#setw -g mode-bg black

setw -g window-status-bg black
setw -g window-status-current-fg green

set -g status-right '#[fg=green]][#[fg=white] #T #[fg=green]][ #[fg=blue]%Y-%m-%d #[fg=white]%H:%M#[default]'

set -g history-limit 8192

bind-key r source-file ~/.tmux.conf


# Bad Wolf by Steve Losh
# =====================
set -g status-fg white
set -g status-bg colour234
# set -g status-bg default #set for transparent background
set -g window-status-activity-attr bold
set -g pane-border-fg colour245
set -g pane-active-border-fg colour39
set -g message-fg colour16
set -g message-bg colour221
set -g message-attr bold
# Custom status bar
# Powerline
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5
# Lets add the current weather to our status bar—why? Well Why the french-toast not?
set -g status-left '#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour238,nobold]#[fg=colour15,bg=colour238,bold]#[fg=colour238,bg=colour234,nobold]'
#set -g status-left " #S "
set -g status-right '#[fg=colour245]❬ %R ❬ %d %b #[fg=colour254,bg=colour234,nobold]#[fg=colour16,bg=colour254,bold] #h '
set -g window-status-format "#[fg=white,bg=colour234] #I #W "
set -g window-status-current-format "#[fg=colour234,bg=colour39]#[fg=colour16,bg=colour39,noreverse,bold] #I ❭ #W #[fg=colour39,bg=colour234,nobold]"
