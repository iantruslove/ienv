 #!/bin/sh

BEGIN_STR="### IENV ###"
END_STR="### VNEI ###"

proceed() {
    echo -n "$1 (y/n) "
    read answer
    echo "$answer" | grep -iq "^y"
    return $?
}

# check if already installed ...
if grep -isq "$BEGIN_STR"  $HOME/.{inputrc,bashrc} && grep -isq "$BEGIN_STR"  $HOME/.{inputrc,bashrc} ; then
    if ! proceed "seems like already installed, proceed?" ; then
        echo "canceled"
        exit;
    fi
fi

# install bashrc
echo $BEGIN_STR >> $HOME/.bashrc
echo "[ -r ~/.ienv/entrypoint ] && source ~/.ienv/entrypoint" >> $HOME/.bashrc
echo $END_STR >> $HOME/.bashrc

# create bash_profile, if needed
if [ ! -f $HOME/.bash_profile ]; then
    if proceed "create .bash_profile?" ; then
        echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> $HOME/.bash_profile
    fi
fi

# install inputrc
echo $BEGIN_STR >> $HOME/.inputrc
echo "\$include ~/.ienv/inputrc" >> $HOME/.inputrc
echo $END_STR >> $HOME/.inputrc

# install gitconfig
echo $BEGIN_STR >> $HOME/.gitconfig
echo "[include]" >> $HOME/.gitconfig
echo "    path = ~/.ienv/gitconfig" >> $HOME/.gitconfig
echo $END_STR >> $HOME/.gitconfig

# install tmux.conf
echo $BEGIN_STR >> $HOME/.tmux.conf
echo "if-shell '[ -r ~/.ienv/tmux ]' \"source-file ~/.ienv/tmux\"" >> $HOME/.tmux.conf
echo $END_STR >> $HOME/.tmux.conf

# Leiningen
# Symlink profiles.clj into ~/.lein
mkdir -p $HOME/.lein
if [ -h $HOME/.lein/profiles.clj ]; then    # it exists, and it's a symlink
    if proceed "Replace symlinked .lein/profiles.clj?" ; then
        rm $HOME/.lein/profiles.clj
        ln -s $HOME/.ienv/lein/profiles.clj $HOME/.lein/profiles.clj
    fi
elif [ -f $HOME/.lein/profiles.clj ]; then  # it exists, and it's a file
    if proceed "Overwrite .lein/profiles.clj?" ; then
        mv $HOME/.lein/profiles.clj $HOME/.lein/profiles.clj.`date "+%Y%m%d-%H%M%S"`
        ln -s $HOME/.ienv/lein/profiles.clj $HOME/.lein/profiles.clj
    else
        echo "Leiningen not fully installed"
    fi
else
    ln -s $HOME/.ienv/lein/profiles.clj $HOME/.lein/profiles.clj
fi

ln -s $HOME/.ienv/lein/src/ $HOME/.lein/src


echo "DONE: You should now restart your session/terminal"
