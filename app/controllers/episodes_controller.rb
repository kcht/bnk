class EpisodesController < ApplicationController
    
    helper_method :url_length
    
    def new
        @welcome_string = "zyy".html_safe
    end

    def create
        @episode = Episode.new(episode_params)

        @episode.save
        redirect_to @episode

      #  render plain: params[:episode].inspect
    end

    def show
        
    end
    
    def welcome_string
        "This is welcome string".html_safe
    end
    
    def url_length(string)
       string.length
    end


    private

    def episode_params
      params.require(:episode).permit(:episode_number, :title, :description, :date)
    end
end
