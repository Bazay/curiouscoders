class SearchController < ApplicationController

  def index
  	@tutorials = Tutorial.all
  	if params[:search].present?
  		get_search_results(params[:search])
  	end
  end

  private 

  def get_search_results(search_params)
    @found_results = []
    @search_string = search_params.to_s.downcase #put to lowercase as all tags are saved in lowercase
    @tutorials.each do |tutorial|
      if tutorial.tags.find_by_name(@search_string)
        @found_results << tutorial
      end         
    end

    if @found_results 
      #@search_location = Venue.create(:address => params[:search])
      #@venues = Venue.near(params[:search], params[:radius], :order => :distance)
      #@json = Tutorial.near(params[:search], params[:radius], :order => :distance).to_gmaps4rails
    else
      @venues = Tutorial.all
      @json = Tutorial.all.to_gmaps4rails
    end
  end
end
