function ytdl
    yt-dlp -f "bv*+ba/b" -o "%(title)s.%(ext)s" -S "ext:mp4:m4a" --embed-metadata --embed-thumbnail $argv
end

