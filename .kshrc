export EDITOR=/bin/vi
export HOSTNAME=`hostname -g`
export TTY=${TTY:-`tty`}
case "$TTY" in
("not a tty"|""|"tty:"*)
  export HISTFILE=$HOME/.ksh_hist_${HOSTNAME}
  ;;
(*)
  export BNAME=`basename $TTY`
  export HISTFILE=$HOME/.ksh_hist_${HOSTNAME}_$BNAME
  ;;
esac

export PS1="\$PWD>"
dd=`date +"%m_%d_%y"`
hn=`uname -n`

#ulimit 1100000

# Get rid of the old histfile
rm -f $HISTFILE
set -o vi
alias md="mkdir"

OS=s390
function pushd
{
  CPWD=$PWD:$CPWD
  if [ "$1" != "" ]
  then
    cd $1
  fi
}

function popd
{
  if [ "$CPWD" = "" ]
  then
    echo "directory stack is empty."
    return 1
  fi
  cd ${CPWD%%:*}
  CPWD=${CPWD#*:}
}

function queued
{
  if [[ "$CPWD" != "" ]]
  then
    echo $(echo $CPWD | sed 's!:/!\\n/!g; s/://g' )
  else
    echo "directory stack is empty."
  fi
}

function swapd
{
  _CPWD_=${CPWD%%:*}
  CPWD="${PWD}:${CPWD#*:}"
  cd $_CPWD_
}

