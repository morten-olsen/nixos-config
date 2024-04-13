if [ -f $HOME/.systemrc ]; then
  source $HOME/.systemrc
fi

if [ -f $HOME/.env ]; then
  source $HOME/.env
fi
