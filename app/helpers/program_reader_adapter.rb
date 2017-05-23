class ProgramReaderAdapter 
	include SongAdapter

	attr_accessor :contents, :number, :title, :date, :description, :songs

	def initialize(filename)
		@contents = File.read(filename)
		parse_contents(@contents)
	end

	private

	def parse_contents(contents)
		lines = @contents.split("\n")
		@number, @title = number_title(lines[0])
		@description, song_lines = parse_description_songs(lines[1, lines.length])
		@songs = get_songs(song_lines)
	end

	def number_title(line)
		number, title = line.split(":")
		number = trim_program_number(number)
		[number.strip, title.strip]
	end

	def trim_program_number(number)
		number_index = number.index(/[0-9]/)
		number[number_index, number.length]
	end

	def parse_description_songs(lines) 
		description = ""
		song_lines = []
		song_started = false
		lines.each do |line|
			if( (line =~ /Playlist/) == 0) 
				song_started = true
			elsif (!song_started)
				description += line + "\n" 
			else	
				song_lines.push(line)
			end
		end
		[description, song_lines]
	end

	def get_songs(song_list)
		songs = []
		song_list.each do |song|
			songs.push(SongAdapter.new(song))
		end
		songs
	end
end