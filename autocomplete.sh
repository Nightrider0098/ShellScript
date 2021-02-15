#! /usr/bin/env bash

_kaptian_autocomplete() #  By convention, the function name starts with an underscore.
{
  
  local prev=${COMP_WORDS[COMP_CWORD-1]}   # Pointer to just the last word
  local totalParam=$COMP_CWORD	#total number of paramters
  local cur=${COMP_WORDS[COMP_CWORD]}   # Pointer to current completion word.    # By convention, it's named "cur" but this isn't strictly necessary.
  COMPREPLY=()   # Array variable storing the possible completions.
           
  
  if [ $totalParam -gt 1 ]; then
	  if [ $prev == 'inventory' ]
	  then 
	   COMPREPLY=( $( compgen -W '-h -t -v -P--target-name --inventory-path --flat --pattern --verbose' -- ${cur} ) )
	   return 0;
	   fi
	   
	   
	   
	   
	  if [ ${COMP_WORDS[COMP_CWORD-2]}  == 'inventory' ]
	  then 
	  	case $prev in
	  
	 		@(-t|--target-name) ) 
				TARGET_NAME=$(ls ./inventory/targets);
				 COMPREPLY=( $( compgen -W "${TARGET_NAME}" -- ${cur} ) );;
		 esac
		 return 0;
	   fi
	fi
   
   
  case "$cur" in

    #base case
   * )
   COMPREPLY=( $( compgen -W 'eval compile inventory searchvar refs lint init validate -h --version --help' -- ${cur} ) );;


#   Generate the completion matches and load them into $COMPREPLY array.
  esac
  return 0
}



complete -F _kaptian_autocomplete -o filenames kapitan
