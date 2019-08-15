# .bashrc

# Source global definitions

if [ -f /etc/bachrc ]; then
  . /etc/bashrc
fi

# Source user definitions

if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
