#!/bin/bash

export NEWT_COLORS='
root=,blue
window=,black
border=white,black
textbox=white,black
button=black,white
entry=,black
checkbox=,black
compactbutton=,blue
'


CHOICE=$(

whiptail --title "Tileltext" --menu "Make your choice" 16 100 9 \
        "1)" "Submenu 1"   \
        "2)" "Submenu 2"  \
        "3)" "Submenu 3" \
        "4)" "Submenu 4" \
        "5)" "Submenu 5" \
        "6)" "Submenu 6" \
        "q)" "quit"  3>&2 2>&1 1>&3
                                                                                                                                                                                                                   
)
                                                                                                                                                                                                                   
result=$(whoami)
                                                                                                                                                                                                                   
case $CHOICE in
        "1)")   
                result="Sub1"
        ;;
        "2)")   
                result="Sub2"
        ;;
        "3)")   
                result="Sub3"
        ;;
        "4)")
                result="Sub4"
        ;;
        "5)")
                result="Sub5"
        ;;
        "6)")
                result="Sub6"
        ;;
        "q)") 
                exit
        ;;
esac

whiptail --msgbox "$result" 16 100
