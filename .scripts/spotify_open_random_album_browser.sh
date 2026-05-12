#!/usr/bin/env bash

source "$HOME/.scripts/env.sh"
url=$(source "$FILE_SPOTIFY_SECRET" && "$HOME/venv/bin/spotify-random-saved-album")
$BROWSERMUSIC "$url"