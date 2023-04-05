#!/bin/bash

# 定義要監聽的所有事件
EVENTS=(
  'application_activated'
  'application_deactivated'
  'application_hidden'
  'application_launched'
  'application_terminated'
  'display_added'
  'display_moved'
  'display_removed'
  'display_resized'
  'display_changed'
  'space_changed'
  'window_created'
  'window_destroyed'
  'window_focused'
  'window_moved'
  'window_resized'
  'window_minimized'
  'window_title_changed'
)

# 定義事件處理函數，根據不同事件顯示不同變數值
handle_event() {
  case "$1" in
    'application_activated' | 'application_deactivated' | 'application_hidden' | 'application_unhidden')
      echo "Event: $1, Bundle ID: $2"
      ;;
    'application_launched' | 'application_terminated')
      echo "Event: $1, Bundle ID: $2, Process ID: $3"
      ;;
    'display_added' | 'display_moved' | 'display_removed' | 'display_resized' | 'display_changed')
      echo "Event: $1, Display ID: $YABAI_DISPLAY_ID"
      ;;
    'space_changed')
      echo "Event: $1, Space ID: $2, Display ID: $YABAI_DISPLAY_ID"
      ;;
    'window_created' | 'window_destroyed' | 'window_focused' | 'window_moved' | 'window_resized' | 'window_minimized' | 'window_unminimized' | 'window_title_changed')
      echo "Event: $1, Window ID: $2, Process ID: $3, Bundle ID: $4"
      ;;
  esac
}

# 監聽所有事件
for EVENT in "${EVENTS[@]}"; do
  yabai -m signal --add event="$EVENT" action="handle_event '$EVENT' # {id} # {pid} # {app}"
done

