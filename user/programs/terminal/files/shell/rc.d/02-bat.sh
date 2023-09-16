if hash bat &> /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export BAT_THEME="MonokaiExtended"
  alias cat="bat"
fi

