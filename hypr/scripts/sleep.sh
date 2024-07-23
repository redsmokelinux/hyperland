swayidle -w timeout 30 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            # timeout 600 'systemctl suspend' 
            