if status is-interactive
    set fish_greeting

    set -Ux EDITOR nvim
    set -Ux STARSHIP_CONFIG ~/.config/starship/starship.toml
	set -Ux JAVA_HOME /usr/lib/jdk/default/

    alias vim="nvim"
	abbr --add mysql /opt/lampp/bin/mysql

    starship init fish | source
end
