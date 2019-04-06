agent() {
  export SSH_AUTH_SOCK=$HOME/.ssh/solo.sock
  if ! ssh-add -l; then
    [ "x$1" = "x-k" -a "$(id -u)" -ne 0 ] && { shift; pkill -f ssh-agent; rm -fr /tmp/ssh-*/; }
    ssh-agent -a "$SSH_AUTH_SOCK"
    set -- "$@" $HOME/.ssh/id_{ed25519,ecdsa,dsa,rsa}
    for k; do [ -e "$k" ] && DISPLAY= ssh-add "$k"; done
  fi </dev/null >&0 2>&0
}
agent
