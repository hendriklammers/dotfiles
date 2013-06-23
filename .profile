
##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi

# TextMate
# set path and simple shell function
export TEXTMATE_PATH=/Applications/TextMate.app/Contents/Resources/mate
mate () {
    $TEXTMATE_PATH $1 $2 $3 $4 $5 $6
}

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

