#!/bin/bash
# Rename lighttpd init script, so it gets called AFTER pepperspot has been started 
# and has created the tun devices!
OLD_NAME="$TARGET_DIR/etc/init.d/S50lighttpd"
NEW_NAME="$TARGET_DIR/etc/init.d/S95lighttpd"
if [ -e "$OLD_NAME" ]; then
  mv "$OLD_NAME" "$NEW_NAME"
fi
exit 0
