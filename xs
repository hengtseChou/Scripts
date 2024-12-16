#!/bin/bash
# ---------------------------------------------------------------------------- #
#    Script made by hengtseChou
#    Run app under xwayland-satellite
# ---------------------------------------------------------------------------- #
if ! command -v xwayland-satellite 2>&1 >/dev/null; then
  echo "[ERROR] xwayland-satellite not installed"
  exit 1
fi

if ! pgrep -x "xwayland-satell" >/dev/null; then

  echo "[INFO] xwayland-satellite is not running"
  read -p "Do you want to start it? (Y/n): " response
  response=${response:-Y}

  if [[ "$response" =~ ^[Yy]$ ]]; then
    (xwayland-satellite &> /dev/null &)
    if [ $? -eq 0 ]; then
      echo "[INFO] xwayland-satellite started"
    else
      echo "[ERROR] Failed to start xwayland-satellite"
      exit 1
    fi
  else
    echo "[INFO] Exiting"
    exit 0
  fi
fi

env DISPLAY=:0 $1
