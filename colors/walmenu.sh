#!/usr/bin/env bash
# Script originated from BreadOnPenguins
SCRIPT=~/Desktop/meow/colors/pywal16

menu() {
		while true; do
    if ! command -v nsxiv >/dev/null; then
        echo "nsxiv not installed"
        exit 1
    fi

    FOLDER=$(ls ~/Desktop/conesque/refs/ | rofi -dmenu -p "Wal")
    if [[ -z "$FOLDER" ]]; then
        echo "No folder selected. Exiting."
        exit 0
    fi

#open images with nsxiv, -o opens all images in the folder
    
	CHOICE=$(nsxiv -otb ~/Desktop/conesque/refs/"$FOLDER"/*)

#only run scripts if a file was actually selected/opened

    if [[ -n "$CHOICE" ]]; then
		$SCRIPT
		echo "Image was selected"	
		break
	else
			echo "damn"
    fi
done
}

# Main entry point
case "$#" in
    0)
        menu
        ;;
    2)
        $SCRIPT
        ;;
    *)
        exit 0
        ;;

esac
