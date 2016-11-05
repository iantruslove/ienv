set -g default-terminal "screen-256color"
set -g base-index 1
setw -g pane-base-index 1
set -g history-limit 100000
set -g status-interval 1
set -g renumber-windows on

setw -g mode-keys vi
set -g status-keys vi
setw -g monitor-activity on

set -sg escape-time 0

# Vim style pane selection
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R


# appeareance
set -g status-justify centre
set -g status-left '#[fg=green](#S)'
set -g status-right '#[fg=brightcyan]#(date +"%H:%M:%S") '
setw -g window-status-format '#F#W'
setw -g window-status-current-format  '#F#W'
setw -g window-status-separator '        '

#### COLOUR (Solarized light)

# default statusbar colors
set-option -g status-bg white #base2
set-option -g status-fg yellow #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg brightyellow #base00
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg white #base2
set-option -g pane-active-border-fg brightcyan #base1

# message text
set-option -g message-bg white #base2
set-option -g message-fg brightred #orange

# pane number display
set-option -g display-panes-active-colour blue #blue
set-option -g display-panes-colour brightred #orange

# clock
set-window-option -g clock-mode-colour brightyellow

# bell
set-window-option -g window-status-bell-style fg=white,bg=red #base2, red
