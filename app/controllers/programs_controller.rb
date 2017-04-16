class ProgramsController < ApplicationController

	def new 
	end

	def create
		@program = Program.new(program_params)

		@program.save
		redirect_to @program
	end

	def show
		@program = Program.find(params[:id])
		@days_ago_s = ProgramsHelper.string_days_ago(@program.airing_date.to_time)
	end

	private 

	def program_params
		params.require(:program).permit(:number, :title, :description, :airing_date)
	end
end
