# module SongUtils
	class SongAdapter 
		attr_reader :title, :artist, :album, :year, :number

		def initialize(song)
			song_attributes = song.split(/(,|\(|\)|(\.)(?= )|(-)(?= ))/)
			song_attributes.select! do |split|
				split.length > 1 || split.match(/[0-9]/)
			end
			@number = song_attributes[0].try(:strip)
			@title = song_attributes[1].try(:strip)
			@artist = song_attributes[2].try(:strip)
			@album = song_attributes[3].try(:strip)
			@year = song_attributes[4].try(:strip)
		end

		
	end
# end