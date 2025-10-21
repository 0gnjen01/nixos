{ pkgs }:

pkgs.writeShellScriptBin "wp-vol" ''
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
  volume=$(echo "$volume" | awk '{print $2}')
  volume=$(echo "( $volume * 100 ) / 1" | bc)
  notify-send -t 1000 -a 'wp-vol' -h int:value:$volume "Volume: ${volume}%"
''
