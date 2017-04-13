class EpisodesController < ApplicationController
    
    helper_method :url_length
    
    def new
        @welcome_string = "zyy".html_safe
    end
    
    def welcome_string
        "This is welcome string".html_safe
    end
    
    def url_length(string)
       string.length
    end
end
