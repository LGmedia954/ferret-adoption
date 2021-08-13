class OpportunitiesController < ApplicationController

    def index
      @opportunities = Opportunity.all
    end

    def show
      @opportunity = Opportunity.find(params[:id])
    end

    def new
      @opportunity = Opportunity.new
    end

    def create
      @opportunity = Opportunity.new(opportunity_params)
      #@opportunity = current_user.opportunities.build(opportunity_params)

      if @opportunity.save
        redirect_to opportunity_path(@opportunity)
      else
        render :new
      end
    end 

    def edit
      @opportunity = Opportunity.find(params[:id])
    end

    def update
      @opportunity = Opportunity.find(params[:id])
      @opportunity = Opportunity.update(opportunity_params)
      flash[:message] = "Opportunity updated."
      redirect_to opportunity_path(@opportunity)
    end

    def case_status
      @opportunity = Opportunity.find(params[:id])
      @opportunity.active = !@opportunity.active 
      @opportunity.save
      redirect_to opportunity_path(@opportunity)
    end

    def destroy
      @opportunity = Opportunity.find(params[:id])
      @opportunity.destroy
      flash[:message] = "Opportunity deleted."
      redirect_to opportunities_path
    end

    private

    def opportunity_params
		params.require(:opportunity).permit(:title, :circumstance, :active, :owner_id, ferret_ids: [])
	end

    

end