#!/bin/bash
function tsw () { # 2 inputs ( 1.txt ) single line clear text and first argument which is the text file containing cipher text
	gnol=$(cat $1 | wc -l)
	v=1
	#echo "Number of lines to process $gnol"
	while [ $v -le $gnol ] # loop will run until all lines are processed
	do
		noofchar=$(cat $1 | awk 'FNR=='$v'' | wc -m)
		noofchar=$((noofchar-1))
		#echo "| row : $v | no of charaters : $noofchar |"
		f=$((f+other))
		[ $v -eq 1 ] && f=$((f+1))
		#f=$((f+1))
		#echo "f --> $f"
		noofchar=$((noofchar+u))
		#echo "$f | $noofchar"
		while [ $f -le $noofchar ]
		do
			r=$(cat 1.txt | awk 'FNR=='$f'')
			#echo "$r | $f / $noofchar"
			#echo $f
			if [ -z $r ]
			then
				echo ' ' | tr -d '\n' >> dec.txt
			else
				echo $r | tr -d '\n' >> dec.txt
			fi
			f=$((f+1))
		done
		gol=$f
		#gol=$((gol+1))
		sed -i "$gol d" 1.txt
		u=$noofchar
		echo "" >> dec.txt
		v=$((v+1))
	done
	#rm 1.txt
	#cp bac.txt 1.txt
}
function l () {
	echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
}
function freefordec () {
	rm 1.txt
	#rm dec.txt
	o=1
}
function freeforenc () {
	#cat 1.txt
	#rm 1.txt
	mv 1.txt enc.txt
}
function main () {
	if [ -z $1 ]
	then
		echo "Please provide the text file as first argument !"
		exit
	fi
	declare -a wor
	wor=(" " "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "-" "_" "+" "=" "~" "[" "]" "{" "}" "|" "\\" ':' ';' '<' '>' ',' '.' '?' '/' "'" '`' '"')
	noe=$(echo ${#wor[@]})
	gnol=$(cat $1 | wc -l) # get number of lines of the input
	l
	cat "$1"
	l
	echo "Number of lines : $gnol"
	echo "Choose one of the following"
	echo "1. Encrypt"
	echo "2. Decrypt"
	read ui
	if [ -z $ui ]
	then
		echo "Please Provide a valid input"
		exit
	elif [ $ui -eq 1 ]
	then
		echo "This process will take some time "
		q=1
		while [ $q -le $gnol ]
		do
			line=$(cat $1 | awk 'FNR=='$q'') #get line
			char=$(cat $1 | awk 'FNR=='$q'' | wc -m) # get char count
			char=$((char-2))
			echo ""
			echo "| Row : $q | Number of charaters : $char | $line"
			#echo ""
			w=0
			while [ $w -le $char ]
			do
				singlechar=$(echo ${line:$w:1}) #we have the single charater to compare and process !
				e=0
				while [ $e -le $noe ] #run through element loop
				do
					se=$(echo "${wor[$e]}")
					if [ "$singlechar" == "$se" ]
					then
						#echo "found $singlechar = $se"
						r=$e
						r=$((r-1))
						#echo "$singlechar --> ${wor[$r]}"
						#echo "${wor[$r]}"
						echo "${wor[$r]}" | tr -d '\n' >> 1.txt
					fi
					e=$((e+1))
				done
				w=$((w+1))
			done
			#echo "$q"
			cat 1.txt | awk 'FNR=='$q''
			q=$((q+1))
			echo "" >> 1.txt
		done
		echo ""
		l
		freeforenc
	elif [ $ui -eq 2 ]
	then
		echo "This process will take some time "
		q=1
		while [ $q -le $gnol ]
		do
			line=$(cat $1 | awk 'FNR=='$q'') #get line
			char=$(cat $1 | awk 'FNR=='$q'' | wc -m) # get char count
			char=$((char-2))
			echo ""
			echo "| Row : $q | Number of charaters : $char | $line"
			#echo ""
			w=0
			while [ $w -le $char ]
			do
				singlechar=$(echo ${line:$w:1}) #we have the single charater to compare and process !
				e=0
				while [ $e -le $noe ] #run through element loop
				do
					#se=$( echo "${wor[$e]}" )
					if [ "$singlechar" == "${wor[$e]}" ]
					then
						#echo "found $singlechar [$w] = $se [$e]"
						r=$e
						r=$((r+1))
						#echo "$singlechar [$w] --> ${wor[$r]} [$e] | [$r] "
						if  [ $r -eq 96 ] #fixing the ( a ) problem
						then
							echo "${wor[1]}" >> 1.txt
						else
							echo "${wor[$r]}" >> 1.txt
						fi
					fi
					e=$((e+1))
				done
				w=$((w+1))
			done
			#echo "$q"
			#cat 1.txt | awk 'FNR=='$q''
			q=$((q+1))
			echo "" >> 1.txt
		done
		echo ""
		l
		#echo ${wor[1]}
		tsw "$1"
		freefordec
	else
		echo "Please Proide a valid input !"
		exit
	fi
}
main "$1"
