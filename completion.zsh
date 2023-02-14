autoload -U compinit; compinit # Initialize completion
_comp_options+=(globdots) # With hidden files

setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END	    # Always place the cursor to the end of the word completed
setopt LIST_PACKED          # The completion menu takes less space

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

zstyle ':completion:*' menu select 							# Show completion menu sections
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'		 	# Green Menu sections
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'	# Yellow Corretion message
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'				# Purple completion message
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'		# Red warnings

zstyle ':completion:*' group-name '' # Group completion results
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 

zstyle ':completion:*' complete-options true

zstyle ':completion:*' file-sort

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Try to complete in case insesitive mode and partialy entered words
