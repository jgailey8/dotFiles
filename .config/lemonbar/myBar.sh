 #!/usr/bin/bash
#  ./myBar.sh | lemonbar -f "Inconsolata for Powerline" -g "x18"
# default space between sections
res_w=$(xrandr | grep "current" | awk '{print $8a}')
if [ ${res_w} -gt 1024 ]; then
  stab='  '
else
  stab=' '
fi

# Char glyps for powerline fonts
sep_left=""                       # Powerline separator left
sep_right=""                       # Powerline separator right
sep_l_left=""                      # Powerline light separator left
sep_l_right=""                     # Powerline light sepatator right

# color definitions 
color_back="#FF1D1F21"              # Default background
color_fore="#FFC5C8C6"              # Default foreground
color_head="#FFB5BD68"              # Background for first element
color_sec_b1="#FF282A2E"            # Background for section 1
color_sec_b2="#FF454A4F"            # Background for section 2
color_sec_b3="#FF60676E"            # Background for section 3
color_icon="#FF979997"              # For icons
color_mail="#FFCE935F"              # Background color for mail alert
color_chat="#FFCC6666"              # Background color for chat alert
color_cpu="#FF5F819D"               # Background color for cpu alert
color_net="#FF5E8D87"               # Background color for net alert
color_disable="#FF1D1F21"           # Foreground for disable elements
color_wsp="#FF8C9440"               # Background for selected workspace

#Define the battery
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        ac=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)
        if [ "$ac" = "on" ]; then
            # notify-send "AC Adapter" "The AC Adapter is on."
            bat_icon=""
        else
            bat_icon=""
            # notify-send "AC Adapter" "The AC Adapter is off."
        fi
        segment="%{F${color_sec_b2}}${sep_left}%{F${color_icon} B${color_sec_b2}} %{T2}${icon_vol}%{F- T1} ${bat_icon} ${BATPERC}"
        # echo "$BATPERC"
        echo -n "$segment"
}

Clock() {
        DATETIME=$(date "+%a %b %d, %T")
        segment="%{F${color_sec_b1}}${sep_left}%{F${color_icon} B${color_sec_b1}} %{T2}${icon_vol}%{F- T1} ${DATETIME}"
        echo -n "$segment"
}
Volume() {
        VOLUME=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
        if amixer get Master | grep -q off; then
                vol_icon=" "
        else
                vol_icon=""

        fi        
        segment="%{F${color_sec_b3}}${sep_left}%{F${color_icon} B${color_sec_b3}} %{T2}${icon_vol}%{F- T1} ${vol_icon} ${VOLUME}"
        echo -n "$segment"
}
Wifi() {
        SSID=$(iwgetid -r)
        wifi_icon=""
        segment="%{F${color_sec_b2}}${sep_left}%{F${color_icon} B${color_sec_b2}} %{T2}${icon_vol}%{F- T1} ${wifi_icon} ${SSID}"
        echo -n "$segment"
}
# Print the percentage
while true; do
    echo "${l}%{r}$(Wifi) $(Volume) $(Battery) $(Clock)"
        sleep 1;
done
