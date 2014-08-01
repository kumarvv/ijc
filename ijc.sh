#!/bin/bash

JRUN_START="import java.util.*; import java.io.*; import java.math.*; public class IJCr{public static void main(String[] s){";
JRUN_END="}}"
JRUN_F=".support/IJCr.java"
JRUN_JC="javac .support/IJCr.java"
JRUN_J="java -cp .support IJCr"
JRUN_FMEM=".support/IJCrmem"
JRUN_FIMP=".support/IJCrimp"

PROMPT="ijc> "
MULTI_LINE_CMD="\`\`"
FULL_CLASS_CMD="\`\`\`"

function ijc_jrun() { 
	cmd="$@"

	cat $JRUN_FIMP > $JRUN_F
	echo "$JRUN_START" >> $JRUN_F
	cat $JRUN_FMEM >> $JRUN_F
	if [[ ! -z $cmd ]]; then 
		echo "$cmd" >> $JRUN_F
	fi
	echo "$JRUN_END" >> $JRUN_F

	printf "\033[0;31m"
	$JRUN_JC
	exitValue=$? 
	printf "\033[0m"

	if [[ $exitValue == 0 ]]; then 
		echo "$cmd" >> $JRUN_FMEM 
		$JRUN_J
	fi 
	echo 
}

function ijc_init() { 
	mkdir -p .support 
	ijc_reset	
}

function ijc_reset() { 
	cat /dev/null > $JRUN_FMEM
	cat /dev/null > $JRUN_FIMP
}

function ijc_welcome() { 
	echo "ijc (Interactive Java Console) v0.1"
	java -version
	echo
}

function ijc_help() {
	echo "ijc help"
	echo 
	echo "Type java statements in \033[1;36m$PROMPT\033[0m prompt and press ENTER to execute. Multiple statements can be entered by enclosing with ``"
	echo 
	echo "\033[1;33mhelp\033[0m          - ijc help"
	echo "\033[1;33mshow\033[0m          - displays current statements from cache"
	echo "\033[1;33mreset\033[0m         - resets statements cache"
	echo "\033[1;33mimport <s>\033[0m    - adds import statements to cache"
	echo "\033[1;33mcp | classpath <s>[:<s>...]\033[0m"
	echo "              - adds classpath to current cache, these will be added to classpath when running statements"
	echo "\033[1;33mprint [s]\033[0m     - shortcut for java System.out.println()"
	echo "\033[1;33m\`\`\033[0m            - start or end multi-line statements"
	echo "\033[1;33mexit | quit\033[0m   - exit ijc"
	echo
}

ijc_welcome
ijc_init

multi_line=false
while true 
do 
	if [[ $multi_line == true ]]; then 
		printf "\033[1;33m"
	fi
	if [[ $multi_line == false ]]; then 
		printf "\033[1;36m$PROMPT\033[1;33m"
	fi
	read cmd
	printf "\033[0m"

	if [[ $cmd == $MULTI_LINE_CMD ]]; then 
		if [[ $multi_line == true ]]; then 
			multi_line=false
			ijc_jrun
		else 
			multi_line=true
		fi
		continue
	fi
	if [[ $multi_line == true ]]; then 
		echo $cmd >> $JRUN_FMEM
		continue
	fi

	if [[ -z cmd || $cmd == "" ]]; then 
		continue
	fi

	case "$cmd" in 
		help)
			ijc_help
			;;
		exit|quit) 
			exit
			;; 
		reset) 
			ijc_reset 
			;; 
		import*)
			echo "$cmd" >> $JRUN_FIMP
			;;
		show)
			cat $JRUN_FMEM 
			;; 
		print[:space:]*)
			ijc_jrun "System.out.println($cmd)"
			;;
		\`\`)
			multi_line=!$multi_line
			;;
		*)
			ijc_jrun "$cmd"
			;;
	esac

	# multi-line 
	# TODO
done 

# echo -e "\033[0mCOLOR_NC (No color)"
# echo -e "\033[1;37mCOLOR_WHITE\t\033[0;30mCOLOR_BLACK"
# echo -e "\033[0;34mCOLOR_BLUE\t\033[1;34mCOLOR_LIGHT_BLUE"
# echo -e "\033[0;32mCOLOR_GREEN\t\033[1;32mCOLOR_LIGHT_GREEN"
# echo -e "\033[0;36mCOLOR_CYAN\t\033[1;36mCOLOR_LIGHT_CYAN"
# echo -e "\033[0;31mCOLOR_RED\t\033[1;31mCOLOR_LIGHT_RED"
# echo -e "\033[0;35mCOLOR_PURPLE\t\033[1;35mCOLOR_LIGHT_PURPLE"
# echo -e "\033[0;33mCOLOR_YELLOW\t\033[1;33mCOLOR_LIGHT_YELLOW"
# echo -e "\033[1;30mCOLOR_GRAY\t\033[0;37mCOLOR_LIGHT_GRAY"
# echo "TEst"

