class HomeController < ApplicationController
  def index
    @users = User.all
    @teams = Team.all
    @tutorials = Tutorial.all
  end
end

	    #def get_topic_results
    	#@found_results = []
    	#@tutorials.each do |tutorial|
      #if tutorial.tags.find_by_name(params[:search]) || tutorial.tags.find_by_name(params[:search.downcase.capitalize])
        #@found_results << tutorial
      #end         
    #end
