#!/bin/bash
# ---------------------------------------------------------------------------- #
#    Script made by hengtseChou
#    Run app under xwayland-satellite
# ---------------------------------------------------------------------------- #
if ! command -v xwayland-satellite 2>&1 >/dev/null; then
  echo "Error: xwayland-satellite not installed."
  exit 1
fi

if ! pgrep -x "xwayland-satell" >/dev/null; then
  read -p "xwayland-satellite is not running. Do you want to start it? (Y/n): " response
  response=${response:-Y}

  # Check the response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    nohup xwayland-satellite > /dev/null 2>&1 &
    echo "xwayland-satellite started."
  else
    echo "Exiting."
    exit 1
  fi
fi

env DISPLAY=:0 $1
