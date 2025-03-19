#!/bin/bash

##############################################
# Author: Kamil BuriXon Burek (BuriXon-code) #
# Name: ZalgoText (zalgo.sh) (c) 2025        #
# Description: Generate zalgo text from      #
#              input data                    #
# Version: v 1.0                             #
# Changelog: release                         #
# Todo: - - -                                #
##############################################

diacritics=(
  '\u0300' '\u0301' '\u0302' '\u0303' '\u0304' '\u0305' '\u0306' '\u0307' '\u0308'
  '\u0309' '\u030A' '\u030B' '\u030C' '\u030D' '\u030E' '\u030F' '\u0310' '\u0311'
  '\u0312' '\u0313' '\u0314' '\u0315' '\u0316' '\u0317' '\u0318' '\u0319' '\u031A'
  '\u031B' '\u031C' '\u031D' '\u031E' '\u031F' '\u0320' '\u0321' '\u0322' '\u0323'
  '\u0324' '\u0325' '\u0326' '\u0327' '\u0328' '\u0329' '\u032A' '\u032B' '\u032C'
  '\u032D' '\u032E' '\u032F' '\u0330' '\u0331' '\u0332' '\u0333' '\u0334' '\u0335'
  '\u0336' '\u0337' '\u0338' '\u0339' '\u033A' '\u033B' '\u033C' '\u033D' '\u033E'
  '\u033F' '\u0340' '\u0341' '\u0342' '\u0343' '\u0344' '\u0350' '\u0351' '\u0352'
  '\u0353' '\u0354' '\u0355' '\u0356' '\u0357' '\u0358' '\u0359' '\u035A' '\u035B'
  '\u035C' '\u035D' '\u035E' '\u035F'
)

crazyness=10
color=""
newline=true

usage() {
  echo "Usage: $(basename "$0") [-c <ANSI 256color|crazy>] [-l <0-100>] [-n] <text>"
  echo "To preview ANSI 256colors check my repo:"
  echo "https://github.com/BuriXon-code/256colors/"
}

while getopts "c:l:nh" opt; do
  case $opt in
    c)
      if [[ "$OPTARG" =~ ^[0-9]+$ ]] && ((OPTARG >= 0 && OPTARG <= 255)); then
        color=$OPTARG
      elif [[ "$OPTARG" == "crazy" ]]; then
        color="crazy"
      else
        echo "Invalid color value: $OPTARG"
        exit 1
      fi
      ;;
    l)
      if [[ "$OPTARG" =~ ^[0-9]+$ ]] && ((OPTARG >= 0 && OPTARG <= 100)); then
        crazyness=$OPTARG
      else
        echo "Invalid level value: $OPTARG"
        exit 1
      fi
      ;;
    n) newline=false ;;
    h) usage; exit 0 ;;
    *) usage; exit 1 ;;
  esac
done

shift $((OPTIND - 1))

if [ $# -lt 1 ]; then
  usage
fi

generate_zalgo() {
  local text="$1"
  local result=""
  local len=${#text}

  for (( i=0; i<$len; i++ )); do
    char="${text:$i:1}"
    char_output="$char"

    for (( j=0; j<crazyness; j++ )); do
      rand_diacritic=${diacritics[RANDOM % ${#diacritics[@]}]}
      char_output+="$rand_diacritic"
    done

    if [[ -n "$color" ]]; then
      if [[ "$color" == "crazy" ]]; then
        rand_color=$((RANDOM % 256))
        result+="\e[38;5;${rand_color}m${char_output}\e[0m"
      else
        result+="\e[38;5;${color}m${char_output}\e[0m"
      fi
    else
      result+="$char_output"
    fi
  done

  echo -e "$result"
}

zalgo_text=$(generate_zalgo "$*")

if $newline; then
  echo -e "\n\n$zalgo_text\n\n"
else
  echo -e "$zalgo_text"
fi
