
ACTION=$1; shift
LOCATION=$PWD

function apply() {
  name=$1
  if [ -z "$name" ]; then
    sudo nixos-rebuild switch --flake $LOCATION
  else
    sudo nixos-rebuild switch --flake "$LOCATION#$name"
  fi
}

function upgrade() {
  if git -C "$LOCATION" diff-index --quiet HEAD --; then
    nix flake update --commit-lock-file "$LOCATION"
  else
    echo "Error: git working tree is dirty"
    exit 1
  fi
}

function cleanup() {
  nix-collect-garbage -d
  nixos-store --optimise
}

case $ACTION in
  apply)
    apply $1
    ;;
  upgrade)
    upgrade $1
    ;;
  *)
    echo "Usage: $0 {apply}"
    exit 1
esac
