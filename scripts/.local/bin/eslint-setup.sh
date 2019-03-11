#!/bin/sh
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Backtitle here"
TITLE="eslint config"
MENU="Choose one of the following options:"

OPTIONS=(1 "eslint-config-react-app"
         2 "eslint-conifg-airbnb")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            export PKG=eslint-config-react-app;
            echo "https://www.npmjs.com/package/eslint-config-react-app"
            echo "install the follwing npm modules"
            npm info "$PKG@latest" peerDependencies
            echo ""
            npm info "$PKG@latest" peerDependencies | command sed 's/[\{\},]//g ; s/: /@/g' | xargs echo
            echo ""
            echo 'eslintrc 
            {
                "extends": "react-app"
            }'
            ;;
        2)
            export PKG=eslint-config-airbnb;
            echo "https://www.npmjs.com/package/eslint-config-airbnb"
            echo "install the follwing npm modules"
            npm info "$PKG@latest" peerDependencies
            echo 'eslintrc 
            {
                "extends": "airbnb"
            }'
            ;;
esac
