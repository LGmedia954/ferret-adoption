class AdoptionRequestsController < ApplicationController
    before_action :set_opportunity

  def index
    @adoption_requests = @opportunity.adoption_requests
  end

  def create
    if @opportunity.ferrets != @owner.ferrets
      @adoption_request = @opportunity.adoption_requests.new(adopter: current_user)
    
    if @adoption_request.save
      flash[:message] = "Adoption request submitted."
      redirect_to questions_path
      # need to notify owner
    else
      redirect_to @opportunity
    end
  end

  private

  def set_opportunity 
    @opportunity = Opportunity.find(params[:opportunity_id])
  end

end