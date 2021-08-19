#!/bin/bash

end="\033[0m"
red='\e[0;31m'
white='\e[0;37m'
lightgreen='\e[0;32m'

###############################################################################################
#Here you should write your outcome, which will happen if the device is disconnected
#For convenience, the function has been put at the very beginning of the code, to make it easier to find and write your actions in general
###############################################################################################

main_menu() {
	clear
	echo -e "${lightgreen}Welcome to GreyHat Flash Key software"
	echo -e "Press [ENTER] to start${end}"
	read go #Just for hold the strings, nevermind
	select_device
	checkflash
}

select_device() {
	clear
	echo -e "${lightgreen}Device's list: ${end}"
	lsusb | grep ID #Show list of all connected USB-devices
	echo -e "${lightgreen}Enter the device's ID in format (1a1b:1234): ${end}"
	read -rp "> " whichdevice
	checkex="$(lsusb | grep $whichdevice)" #Checking for user-entered device exists..
	if [ "$checkex" != "" ];then
		id=$whichdevice
	else
		echo "Looks like you've typed wrong device"
		echo "Select a correct device!"
		echo "Press [Enter] and try again"
		read asdasdad #Just for hold the strings, nevermind
		clear
		select_device
	fi
	clear	
}

things() {
	source things.txt
}

checkflash() {
	while sleep 0.1
	do
		dev="$(lsusb | grep "$id")" #Checking if device connected
		if [ "$dev" != "" ];then
			clear
			echo -e "${lightgreen}It works!${end}"
			echo ""
			echo -e "${white}GFLashkEy now monitors the presence of the device with ID '$id'."
			echo -e "You can minimize this window and go about your business."
			echo -e "As soon as the device is removed, the script will perform your action. Have a nice day!${end}"
		else #If device disconnected, do things
			clear
			echo -e "${red}Device disconnection detected. Performing actions.${end}"
			things > /dev/null 2>&1
			clear
			echo -e "${white}Things done. Have a nice day!${end}"
			exit 0
		fi
	done
}

check_root() {
	if (( "$EUID" == 0 ));then #Checking if user is root
		main_menu
	else
		echo "Sorry, I need root to do things!"
		echo "Without root, probably, I couldn't do some things which requies root access"
		echo "Are you sure you want to continue?(y/n)"
		read -rp ">>> " con
		case $con in
			y)
			main_menu
			;;
			n)
			exit 0
			;;
			*)
			check_root
			;;
		esac
	fi
}

case $1 in
	-h | --help)
		clear
		echo "Welcome to GFLashkEy!"
		echo "GFLashkEy - is a simple bash script which will monitor the presence of the specified device (usb flash drive, mouse, etc.) in the computer. "
		echo "When the selected device is disconnected, the script will perform the actions you specify. Initially, this action unmounts all mounted veracrypt volumes."
		echo "In order to do something like the standard GFLashkEy, you need root access, but it's still really to run without root"
		echo ""
		echo "Usage : First, set manually the actions to be performed (type them in the things() function)."
		echo "Next, run the script and select the device which will be monitored. To do this, specify its ID, it can be found in the list of devices, which will give you GFLashkEy."
		echo "The ID consists of 4 characters and 4 digits (it is enough to specify any one). The ID is unique for each device."
		echo "Then, GFLashkEy will cycle through checking for it, you can see the corresponding inscription in the terminal window."
		echo "As soon as the device is removed from the computer, GFLashkEy will immediately begin to perform the specified actions. When they are done, you will see a message saying that they are done."
		echo ""
		echo "Special use : do not start the terminal in the same partition which will be unmounted (if you are going to unmount it with GFLashkEy), because the partition cannot be unmounted if it is 'busy'."
		echo "If you close the terminal to 'release' the partition, the script will close and will not perform the specified actions."
		echo "Also, specify a kill for each running process in the partition, otherwise you will not be able to unmount it." 
		echo "Consider every feature and situation to ensure that the script works 100% correctly."
		;;
	"")
		check_root
		;;
	*)
		echo "Usage : ./GFLashkEy"
		echo ""
		echo "Type --help/-h to print help banner"
esac
