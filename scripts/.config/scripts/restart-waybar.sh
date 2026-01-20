#!/bin/bash

# Enhanced Waybar restart script

# Kill Waybar without affecting the script
echo "Stopping Waybar..."
pkill -x waybar

# Wait for process cleanup
sleep 0.5

# Check if Waybar is still running (force kill if needed)
if pgrep -x waybar >/dev/null; then
  echo "Waybar still running, force killing..."
  pkill -9 -x waybar
  sleep 0.5
fi

# Restart Waybar - IMPORTANT: Disown it so it doesn't get killed with script
echo "Starting Waybar..."
nohup waybar >/tmp/waybar.log 2>&1 &

# Alternative if you want to see output in terminal:
# waybar &

# Check if Waybar started successfully
sleep 1
if pgrep -x waybar >/dev/null; then
  echo "Waybar restarted successfully!"
  notify-send "Waybar" "✓ Restarted successfully" -t 2000 2>/dev/null
else
  echo "Failed to restart Waybar!"
  notify-send "Waybar" "✗ Failed to restart" -t 3000 -u critical 2>/dev/null
fi
