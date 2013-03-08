# http://unix.stackexchange.com/questions/9883/how-can-i-run-a-script-immediately-after-connecting-via-ssh
if [ -n "$LC_tmux_session" ]; then
  session=$LC_tmux_session
  unset LC_tmux_session
  if tmux has -t $session; then
    exec tmux attach -t $session
  else
    exec tmux new-session -s $session
  fi
fi

