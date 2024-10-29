export ENV=$HOME/.kshrc
export BASH_ENV=$HOME/.kshrc

PATH=$HOME/bin:$PATH

export TMPDIR=$HOME/tmp
umask 022

set -o emacs
. .kshrc

