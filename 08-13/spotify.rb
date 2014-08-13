require "httparty"
require "pry"

class Artist
  def initialize id, name
    @id, @name = id, name
  end

  def related_artists
    SpotifyAPI.find_related_artists @id
  end
end


class SpotifyAPI
  include HTTParty

  base_uri "https://api.spotify.com/v1"

  def self.related_artists artist_name
    artist = find_artist_by_name(artist_name)
    artist.related_artists
  end

  def self.find_artist_by_name artist_name
    #response = get "/search?q=#{artist_name}&type=artist"
    response = get "/search",
      query: { q: artist_name, type: "artist" }
    artist_data = response["artists"]["items"].first # [0]
    Artist.new artist_data["id"], artist_data["name"]
  end

  def self.find_related_artists id
    # GET https://api.spotify.com/v1/artists/{id}/related-artists
    response = get "/artists/#{id}/related-artists"

    # Top hit for related artist
    #artist_data = response["artists"].first # [0]
    #Artist.new artist_data["id"], artist_data["name"]

    # Show all related artists
    response["artists"].map do |artist_data|
      Artist.new artist_data["id"], artist_data["name"]
    end
  end
end

battles = SpotifyAPI.find_artist_by_name "Battles"
binding.pry
