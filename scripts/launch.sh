# ██╗      █████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗███████╗██████╗ 
# ██║     ██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║██╔════╝██╔══██╗
# ██║     ███████║██║   ██║██╔██╗ ██║██║     ███████║█████╗  ██████╔╝
# ██║     ██╔══██║██║   ██║██║╚██╗██║██║     ██╔══██║██╔══╝  ██╔══██╗
# ███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║███████╗██║  ██║
# ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
# by theposintech (2023)
# ------------------------------------------------------------------

#!/bin/bash
SELECTED_THEME=$1
WAY_DIR=$2

if [ ! "$pgrep swww-daemon" ]; then
	swww-daemon --format xrgb
fi

if pgrep waybar > /dev/null; then
    pkill waybar
fi
waybar &

CURRENT_THEME_FILE="$WAY_DIR/current-theme.txt"

if [ -f "$CURRENT_THEME_FILE" ]; then
    SELECTED_THEME=$(cat "$CURRENT_THEME_FILE")
    $WAY_DIR/themeswitcher.sh "$SELECTED_THEME"
else
    DEFAULT_THEME="green-beach"
    echo "$DEFAULT_THEME" > "$CURRENT_THEME_FILE"
    $WAY_DIR/themeswitcher.sh "$DEFAULT_THEME"
fi
