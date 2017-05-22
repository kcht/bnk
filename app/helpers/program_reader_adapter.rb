class ProgramReaderAdapter 

	attr_accessor :contents

	def read_from_file(filename)
		@contents = File.read(filename)
	end

	private

	def parse_contents(contents)
		lines = @contents.split("\n")
		@number, @title = number_title(lines[0])
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

	def description(lines) 
		description = ""
		lines.each do |line|
			break if line =~ /Playlist/
			description += line + "\n"
		end
		description
	end
end