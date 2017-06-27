#!/bin/bash
# A menu driven shell script to manage openvpn connection
# uses an environment
fallBackVpn=US_Chicago
vpn_list=( `pia -l | awk '{if(NR>1)print}' | tr -s ' ' | tr ' ' '_' | awk '{print substr($0,2,length($0)-2)}' `)
if [ -z "$VPN" ]; then
    VPN=$fallBackVpn
    echo "vpn is not set using fallback $fallbackvpn"
else
    if ! [[ ${vpn_list[*]} =~ "$VPN" ]]; then
        fallBackVpn=US_Chicago
        VPN=$fallBackVpn
    fi
fi

RED='\033[31m'
GREEN='\033[32m'
BOLD='\033[1m'
BLUE='\033[34m'
STD='\033[0;0;39m'

pause() {
    read -p "Press [Enter] key to continue..." fackEnterKey
}

connect(){
    # sudo /bin/systemctl start openvpn-client@$VPN
    sudo openvpn --config /etc/openvpn/client/"$VPN.conf"
    exit 0
    # pause
}

# do something in two()
disconnect(){
    sudo /bin/systemctl stop openvpn-client@$VPN
    exit 0
    # pause
}

selectvpn()
{
    # echo "Size of array: $#"
    select option; do # in "$@" is the default
        if [ "$REPLY" -eq "$#" ];
        then
            echo "Exiting..."
            break;
        elif [ 1 -le "$REPLY" ] && [ "$REPLY" -le $(($#-1)) ];
        then
            selected_vpn=$option
            break;
        else
            echo "Incorrect Input: Select a number 1-$#"
        fi
    done
}

setVpn() {
    echo
    selectvpn "${vpn_list[@]}"
    export VPN=$selected_vpn
    pause
}

vpnActive() {
    # while true
    # do
        var=$(ip route show | grep tun0)
        # var=$(systemctl show openvpn-client | grep ActiveState=active)
        if [[ -z "$var" ]]; then
            echo -e "${BOLD}${RED}false${STD}"
            # echo false
        else
            echo -e "${BOLD}${GREEN}true${STD}"
            # echo true
        fi

        sleep 0.25
    # done
}

# function to display menus
show_menus() {
    clear
    echo -e "VPN: ${BOLD}$VPN${STD}"
    echo -e "connected: $(vpnActive)"
    echo "1. Connect"
    echo "2. Disconnect"
    echo "3. Set Server"
    echo "4. Exit"
}

# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
    local choice
    read -p "Enter choice [ 1 - 4] " choice
    case $choice in
        1) connect;;
        2) disconnect;;
        3) setVpn;;
        4) exit 0;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
    show_menus
    read_options
done
