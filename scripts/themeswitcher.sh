# ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
# ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
#    ██║   ███████║█████╗  ██╔████╔██║█████╗  
#    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
#    ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
#    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝                                          
# ███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗███████╗██████╗ 
# ██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔══██╗
# ███████╗██║ █╗ ██║██║   ██║   ██║     ███████║█████╗  ██████╔╝
# ╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║██╔══╝  ██╔══██╗
# ███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║███████╗██║  ██║
# ╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
# by theposintech (2023)
# ------------------------------------------------------------------

#!/bin/bash
WAY_DIR="$HOME/.config/waybar"

THEMES_DIR="$WAY_DIR/themes"

THEMES=$(ls -1 $THEMES_DIR)

SELECTED_THEME=$(echo "$THEMES" | rofi -dmenu -p "Theme:")

if [ -z "$SELECTED_THEME" ]; then
    exit 0
fi

echo "$SELECTED_THEME" > "$WAY_DIR/current-theme.txt"

if [ -f "$WAY_DIR/style.css" ]; then 
	rm "style.css"
fi

cp "$THEMES_DIR/$SELECTED_THEME/style.css" "$WAY_DIR"

$WAY_DIR/scripts/wallpaperswitcher.sh "$SELECTED_THEME" "$THEMES" "$WAY_DIR"
$WAY_DIR/scripts/launch.sh "$SELECTED_THEME" "$WAY_DIR"

if pgrep waybar > /dev/null; then
    pkill waybar
fi
waybar &
