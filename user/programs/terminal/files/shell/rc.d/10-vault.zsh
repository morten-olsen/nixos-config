function _bw_replace_env() {
  env | while IFS= read -r line; do
    value=${line#*=}
    name=${line%%=*}
    if [[ $value = bw://* ]]; then;
      item=${value:5}
      secret=`bw get password $item`
      export $name="$secret"
    fi
  done
}

function clam-open() {
  command=$1
  if [[ -z "$BW_SESSION" ]]; then;
    export BW_SESSION=`bw unlock --raw`
  fi 
  _bw_replace_env
  if [[ ! -z "$command" ]]; then;
    eval $command
  fi
}

function clam-close() {
  unset BW_SESSION
}
