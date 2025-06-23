
#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "🔇" || echo "$volume")
echo "{\"text\": \"$muted\"}"
