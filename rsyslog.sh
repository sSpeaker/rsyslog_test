CONF_FILE=/etc/rsyslog.conf

echo -n > $CONF_FILE

[ -n "${LISTEN_UDP}" ] && {
  cat << EOF >> $CONF_FILE
module(load="imudp")
input(type="imudp" port="514")

EOF
}

[ -n "${LISTEN_SOCKET}" ] && {
  cat << EOF >>  $CONF_FILE
module(load="imuxsock")
input(type="imuxsock" Socket="/rsyslog/socket" CreatePath="on")

EOF
}

echo "*.* $LOG_TARGET" >> $CONF_FILE
