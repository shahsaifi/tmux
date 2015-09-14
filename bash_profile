# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export JAVA_HOME=/export/apps/jdk/JDK-1_6_0_27
export NLS_LANG=American_America.UTF8
export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:/usr/local/bin:/usr/local/mysql/bin:$ITOPS_HOME/bin:/opt/sublimetext2:/opt/maven/bin:/home/shahsaifi/dotfiles/bin
#export PS1="\[$(tput bold)$(tput setaf 5)\]\u@\h:\w $ \[$(tput sgr0)\]"
#export PS1="[\[\e[31;1m\]\u@\[\e[30;1m\]\h \[\e[32;0m\]\w ]\$ "
export PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
complete -cf sudo
irssi_notifier() {
    ssh shahsaifi@shahsaifi1 'echo -n "" > ~/.irssi/fnotify; tail -f ~/.irssi/fnotify' | \
            while read heading message; do
            url=`echo \"$message\" | grep -Eo 'https?://[^ >]+' | head -1`;

            if [ ! "$url" ]; then
                terminal-notifier -title "\"$heading\"" -message "\"$message\"" -activate com.apple.Terminal;
            else
                terminal-notifier -title "\"$heading\"" -message "\"$message\"" -open "\"$url\"";
            fi;
        done
    }
