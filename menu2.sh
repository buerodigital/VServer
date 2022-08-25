#!/bin/bash

export NEWT_COLORS='
root=,blue
window=,white
border=white,blue
textbox=white,blue
button=blue,white
entry=,white
checkbox=,blue
compactbutton=,white
'

funct_main () {
CHOICE=$(
whiptail --title "Tileltext" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
        "1)" "Submenu 1" \
        "2)" "Submenu 2" \
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
                funct_sub1
        ;;
        "2)")   
                result="Sub2"
                funct_main
        ;;
        "3)")   
                result="Sub3"
                funct_main
        ;;
        "4)")
                result="Sub4"
                funct_main
        ;;
        "5)")
                result="Sub5"
                funct_main
        ;;
        "6)")
                result="Sub6"
                funct main
        ;;
        "q)") 
                exit
        ;;
esac
}

funct_sub1 () {
CHOICE=$(
whiptail --title "Tileltext" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
        "1)" "Doing 1" \
        "2)" "Doing 2" \
        "3)" "Doing 3" \
        "4)" "Doing 4" \
        "5)" "Doing 5" \
        "6)" "Doing 6" \
        "b)" "zurück" \
        "q)" "quit"  3>&2 2>&1 1>&3  
)
                                                                                                                                                                                                                   
result=$(whoami)
                                                                                                                                                                                                                   
case $CHOICE in
        "1)")   
                result="Do1"
                funct_sub1
        ;;
        "2)")   
                result="Do2"
                funct_sub1
        ;;
        "3)")   
                result="Do3"
                funct_sub1
        ;;
        "4)")
                result="Do4"
                funct_sub1
        ;;
        "5)")
                result="Do5"
                funct_sub1
        ;;
        "6)")
                result="Do6"
                funct_sub1
        ;;
        "b)") 
                funct_main
        ;;
        "q)") 
                exit
        ;;
esac
}


funct_main
