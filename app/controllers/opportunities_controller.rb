class OpportunitiesController < ApplicationController

    def index
      @opportunities = Opportunity.all
    end

    def new
    end

    def create
      @opportunity = Opportunity.new
      @opportunity.title = params[:title]
      @opportunity.circumstance = params[:circumstance]

      @opportunity.save
      redirect_to opportunity_path(@opportunity)
    end 

    def show
      @opportunity = Opportunity.find(params[:id])
    end


end
