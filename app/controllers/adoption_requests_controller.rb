class AdoptionRequestsController < ApplicationController
    before_action :set_opportunity

  def index
    if @opportunity.owner == current_user
      @adoption_requests = @opportunity.adoption_requests
    else
      redirect_to opportunities_path
    end
  end

  def create
    if @opportunity.owner == current_user
      flash[:message] = "This is your ferret!"
      redirect_to opportunity_path(@opportunity)
    else
      @adoption_request = @opportunity.adoption_requests.new(adopter: current_user)

      @adoption_request.save
      flash[:message] = "Adoption request submitted."
      redirect_to questions_path
    end
  end

  private

  def set_opportunity 
    @opportunity = Opportunity.find(params[:opportunity_id])
  end

end