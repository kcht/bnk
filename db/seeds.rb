# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

programs = Dir.entries("db/bnk_data")
programs.select! {|program| program.match("bnk*")}

# programs.each do |program|
	pra = ProgramReaderAdapter.new("db/bnk_data/" + programs[0])
	Program.create({
		number: pra.number,
		title: pra.title,
		description: pra.description
	})
	pra.songs.each do |song|
		Song.create({
			title: song.title,
			artist: song.artist,
			album: song.album,
			year: song.year,
			program_id: pra.number
		})
	end


# end