until qbittorrent; do
    echo "Qbittorrent crashed with exit code $?.  Respawning.." >&2
    sleep 1
done
