class SongsController < ApplicationController
	def index
		@program.songs
	end

	def create 
		@program = Program.find(params[:program_id])
		@song = @program.songs.create(song_params)
		redirect_to program_path(@program)
	end

	private

	def song_params
		params.require(:song).permit(:title, :artist, :album, :year)
	end
end
