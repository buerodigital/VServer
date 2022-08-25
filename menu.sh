#!/bin/bash


funct_main () {
CHOICE=$(
whiptail --title "Main Menu" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Submenu 1" \
	"2)" "Submenu 2" \
	"3)" "Submenu 3" \
	"==" "============================ " \
	"q)" "quit"  3>&2 2>&1 1>&3
)

case $CHOICE in
	"1)")
		funct_sub1
		;;
	"2)")
		funct_sub2
		;;
	"3)")
		funct_sub3
		;;
	"==")
		funct_main
		;;
	"q)") 
		exit
		;;
esac
}


funct_sub1 () {
CHOICE=$(
whiptail --title "Submenu 1" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Sub 1 Doing 1" \
	"2)" "Sub 1 Doing 2" \
	"3)" "Sub 1 Doing 3" \
	"4)" "Sub 1 Doing 4" \
	"5)" "Sub 1 Doing 5" \
	"6)" "Sub 1 Doing 6" \
	"==" "============================ " \
	"b)" "back" \
	"q)" "quit"  3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		result="Sub1_Do1"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"2)")
		result="Sub1_Do2"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"3)")
		result="Sub1_Do3"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"4)")
		result="Sub1_Do4"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"5)")
		result="Sub1_Do5"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"6)")
		result="Sub1_Do6"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"b)") 
		funct_main
		;;
	"==") 
		funct_sub1
		;;
	"q)") 
		exit
		;;
esac
}


funct_sub2 () {
CHOICE=$(
whiptail --title "Submenu 2" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Sub 2_1" \
	"2)" "Sub 2 Doing 2" \
	"3)" "Sub 2 Doing 3" \
	"4)" "Sub 2 Doing 4" \
	"5)" "Sub 2 Doing 5" \
	"6)" "Sub 2 Doing 6" \
	"==" "============================ " \
	"b)" "back" \
	"q)" "quit"  3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		funct_sub2_1
		;;
	"2)")
		result="Sub2_Do2"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"3)")
		result="Sub2_Do3"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"4)")
		result="Sub2_Do4"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"5)")
		result="Sub2_Do5"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"6)")
		result="Sub2_Do6"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"==") 
		funct_sub2
		;;
	"b)") 
		funct_main
		;;
	"q)") 
		exit
		;;
esac
}


funct_sub2_1 () {
CHOICE=$(
whiptail --title "Submenu 2_1" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Sub 2_1 Doing 1" \
	"2)" "Sub 2_1 Doing 2" \
	"3)" "Sub 2_1 Doing 3" \
	"4)" "Sub 2_1 Doing 4" \
	"5)" "Sub 2_1 Doing 5" \
	"6)" "Sub 2_1 Doing 6" \
	"==" "============================ " \
	"b)" "back" \
	"q)" "quit"  3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		result="Sub2_1_Do1"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"2)")
		result="Sub2_1_Do2"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"3)")
		result="Sub2_1_Do3"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"4)")
		result="Sub2_1_Do4"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"5)")
		result="Sub2_1_Do5"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"6)")
		result="Sub2_1_Do6"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"b)") 
		funct_sub2_1
		;;
	"b)") 
		funct_sub2
		;;
	"q)") 
		exit
		;;
esac
}


funct_sub3 () {
CHOICE=$(
whiptail --title "Submenu 3" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Sub 3 Doing 1" \
	"2)" "Sub 3 Doing 2" \
	"3)" "Sub 3 Doing 3" \
	"4)" "Sub 3 Doing 4" \
	"5)" "Sub 3 Doing 5" \
	"6)" "Sub 3 Doing 6" \
	"==" "============================ " \
	"b)" "back" \
	"q)" "quit"  3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		result="Sub3_Do1"
		whiptail --msgbox "$result" 16 100
		funct_sub3
		;;
	"2)")
		result="Sub3_Do2"
		whiptail --msgbox "$result" 16 100
		funct_sub3
		;;
	"3)")
		result="Sub3_Do3"
		whiptail --msgbox "$result" 16 100
		funct_sub3
		;;
	"4)")
		result="Sub3_Do4"
		whiptail --msgbox "$result" 16 100
		funct_sub3
		;;
	"5)")
		result="Sub3_Do5"
		whiptail --msgbox "$result" 16 100
		funct_sub3
		;;
	"6)")
		result="Sub3_Do6"
		whiptail --msgbox "$result" 16 100
		funct_sub
		;;
	"b)") 
		funct_sub3
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
