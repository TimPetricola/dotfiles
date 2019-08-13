if application "Spotify" is running then
  tell application "Spotify"
    if player state is playing then
      pause
    end if
  end tell
end if
