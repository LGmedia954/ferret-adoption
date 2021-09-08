class AdoptionRequestsController < ApplicationController
    before_action :set_opportunity

  def index
    @adoption_requests = @opportunity.adoption_requests
  end

  def create
    if @opportunity.ferrets != current_user.ferrets
      @adoption_request = @opportunity.adoption_requests.new(adopter: current_user)

      if @adoption_request.save
        flash[:message] = "Adoption request submitted."
        redirect_to questions_path
      else
        redirect_to opportunity_path(@opportunity)
      end
    end
  end

  private

  def set_opportunity 
    @opportunity = Opportunity.find(params[:opportunity_id])
  end

end