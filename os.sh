
function help() {
  echo "Usage: $0 {apply|upgrade|init} [name]"
  exit 1
}

if [ -z "$1" ]; then
  help
fi

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

function buildvm() {
  nixos-rebuild build-vm --flake "$LOCATION#vm"
  "$LOCATION/result/bin/run-test-vm-vm"
}

function upgrade() {
  if git -C "$LOCATION" diff-index --quiet HEAD --; then
    nix flake update --commit-lock-file --flake "$LOCATION"
    apply $1
  else
    echo "Error: git working tree is dirty"
    exit 1
  fi
}

function cleanup() {
  amount=${1:-"7d"}
  nix-env --delete-generations "$amount"
  nix-collect-garbage -d
  nix-store --optimise
  nix-store --verify --check-contents --repair
}

function init() {
  mkdir -p "$LOCATION"
  git clone "https://github.com/morten-olsen/home-server.git" "$LOCATION"
}

case $ACTION in
  init)
    init $1
    ;;
  apply)
    apply $1
    ;;
  upgrade)
    upgrade $1
    ;;
  build-vm)
    buildvm $1
    ;;
  cleanup)
    cleanup $1
    ;;
  *)
    help
    ;;
esac
