json.extract! thatch, :id, :song_title, :artist, :year, :album_art, :song, :created_at, :updated_at
json.url thatch_url(thatch, format: :json)
json.album_art url_for(thatch.album_art)
json.song url_for(thatch.song)
