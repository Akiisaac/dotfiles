source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    fastfetch
    cat ~/.cache/wal/sequences
end

function walupd
    wal -i $argv[1]
    ~/.config/dunst/update_dunstrc.sh
    killall dunst
end
