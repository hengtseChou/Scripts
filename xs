#!/bin/bash
# ---------------------------------------------------------------------------- #
#    Script made by hengtseChou
#    Run app under xwayland-satellite
# ---------------------------------------------------------------------------- #
if ! command -v xwayland-satellite 2>&1 >/dev/null; then
  echo "error: xwayland-satellite not installed."
  exit 1
fi

if ! pgrep -x "xwayland-satell" >/dev/null; then

  read -p "xwayland-satellite is not running. Do you want to start it? (Y/n): " response
  response=${response:-Y}

  if [[ "$response" =~ ^[Yy]$ ]]; then
    (xwayland-satellite &> /dev/null &)
    if [ $? -eq 0 ]; then
      echo "xwayland-satellite started."
    else
      echo "failed to start xwayland-satellite."
      exit 1
    fi
  else
    echo "exiting."
    exit 1
  fi
fi

env DISPLAY=:0 $1
