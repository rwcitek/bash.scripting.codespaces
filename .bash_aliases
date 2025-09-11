export EDITOR=vim


alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cls=clear
alias dir='ls -la'
alias docker.container.stop.jupyter='docker container stop jupyter'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gh.codespace.stop='gh codespace stop --codespace $CODESPACE_NAME'
alias gh.codespace.delete='gh codespace delete --force --codespace $CODESPACE_NAME'
alias grep='grep --color=auto'
alias h='history'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias more='less -iX'
alias rvm-restart='rvm_reload_flag=1 source '\''/usr/local/rvm/scripts/rvm'\'''


cd $( mktemp -d /tmp/zfoo.$(date +%s.%N).XXXX )
env > env.alias.txt
echo "===" >> env.alias.txt
echo "${PWD}" >> env.alias.txt
echo "===" >> env.alias.txt
ls -la "${PWD}" >> env.alias.txt
echo "===" >> env.alias.txt
ls -la . >> env.alias.txt
echo "=== tmp" >> env.alias.txt
ls -la /tmp/ >> env.alias.txt
echo "=== tmp" >> env.alias.txt
date >> env.alias.txt
cat -n jupyter.log >> env.alias.txt


[ -f jupyter.log ] || echo "wtf-1" >> env.alias.txt
[ -f jupyter.log ] && echo "wtf-2" >> env.alias.txt
[ ! -f jupyter.log ] || echo "wtf-3" >> env.alias.txt
[ ! -f jupyter.log ] && echo "wtf-4" >> env.alias.txt

test -f jupyter.log || echo "wtf-5" >> env.alias.txt
test -f jupyter.log && echo "wtf-6" >> env.alias.txt


{
  echo "x==" >> env.alias.txt
  ls -la "${PWD}" >> env.alias.txt
  echo "x==" >> env.alias.txt
  ls -la . >> env.alias.txt
  echo "x==" >> env.alias.txt
  ${OLDPWD}/jupyter.light.sh >& jupyter.log &
}

