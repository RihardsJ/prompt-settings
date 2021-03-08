source /home/rihards/.config/zsh/.aliases.zsh

_comp_options+=(globdots) # With hidden files
source /home/rihards/.config/zsh/completion.zsh

fpath=(/home/rihards/.config/zsh/ $fpath)
autoload -Uz prompt.zsh; prompt.zsh

autoload -U add-zsh-hook

source $(dirname $(gem which colorls))/tab_complete.sh

source /home/rihards/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source /home/rihards/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

