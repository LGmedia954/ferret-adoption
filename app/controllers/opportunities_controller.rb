class OpportunitiesController < ApplicationController

    def index
      @opportunities = Opportunity.all
    end

    def show
      @opportunity = Opportunity.find(params[:id])
    end

    def new
    end

    def create
      @opportunity = Opportunity.new(opportunity_params(:title, :circumstance))

      @opportunity.save
      redirect_to opportunity_path(@opportunity)
    end 

    def edit
      @opportunity = Opportunity.find(params[:id])
    end

    def update
      @opportunity = Opportunity.find(params[:id])
      @opportunity.title = params[:title]
      @opportunity.circumstance = params[:circumstance]
  
      redirect_to opportunity_path(@opportunity)
    end 

    private

    def opportunity_params(*args)
		params.require(:opportunity).permit(*args)
	end

    

end
