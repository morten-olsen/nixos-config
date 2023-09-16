name=$1

if [ -z "$name" ]; then
  sudo nixos-rebuild switch --flake .
else
  sudo nixos-rebuild switch --flake ".#$name"
fi
