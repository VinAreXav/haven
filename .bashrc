#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1=' || \u \h ||  \W  <>   '



show_month() {
  month_num=$1
  year=$(date +%Y)
  month_name=$(date -d "$year-$month_num-01" +%B)

  # Big header
  toilet -t --rainbow "$(date +'%d %A')"
   
  # Center the calendar grid
  cal -m "$(date +%m)" "$(date +%Y)" | awk -v cols=$(tput cols) '{ 
    padding = int((cols - length($0)) / 2); 
    printf "%*s%s\n", padding, "", $0 
  }'
}
alias nv=nvim
alias tt='tty-clock -c -s -b -n'
alias cm='show_month $(date +%m)'
alias jan='show_month 01'
alias feb='show_month 02'
alias mar='show_month 03'
alias apr='show_month 04'
alias may='show_month 05'
alias jun='show_month 06'
alias jul='show_month 07'
alias aug='show_month 08'
alias sep='show_month 09'
alias oct='show_month 10'
alias nov='show_month 11'
alias dec='show_month 12'

export EDITOR="nvim"
export VISUAL="nvim"
