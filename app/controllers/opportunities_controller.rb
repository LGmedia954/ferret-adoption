class OpportunitiesController < ApplicationController
  before_action :require_logged_in
  
  def index
    @opportunities = Opportunity.all.recent  #scope
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end

  def new
    @owner = Owner.find(session[:owner_id])
    #@ferrets = Ferret.where(:owner_id => current_user.id)
    current_user.ferrets
    @opportunity = current_user.opportunities.new
  end

  def create
    @owner = Owner.find(session[:owner_id])
    #@ferrets = Ferret.where(:owner_id => current_user.id)
    current_user.ferrets
    @opportunity = @owner.opportunities.build(opportunity_params)

    if @opportunity.save
      flash[:message] = "Opportunity added. Good luck!"
      redirect_to opportunity_path(@opportunity)
    else
      render 'new'
    end
  end

    def adoption_request
      @owner = Owner.find(session[:owner_id])
      @opportunity = Opportunity.find(params[:id])
      #byebug
      @opportunity.adopter_id = [] << current_user.id
      current_user.req_id = [] << @opportunity.id
      flash[:message] = "Adoption request submitted."
      redirect_to questions_path
    end

  def edit
    @opportunity = Opportunity.find(params[:id])

    if @opportunity.owner != current_user
      flash[:message] = "You may only edit your own opportunities."
      redirect_to opportunities_path
    end
  end

  def update
    @opportunity = Opportunity.find(params[:id])
    @opportunity.update(opportunity_params)
    if @opportunity.save
      flash[:message] = "Details updated."
      redirect_to opportunity_path(@opportunity)
    else
      render :edit
    end
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    if @opportunity.owner != current_user
      flash[:message] = "You may only delete your own opportunities."
      redirect_to opportunities_path
    else
      @opportunity.destroy
      flash[:message] = "Opportunity deleted."
      redirect_to opportunities_path
    end
  end

    private

  def opportunity_params
		params.require(:opportunity).permit(:title, :circumstance, :active, :owner_id, :ferret_id, :adopter_id, :ferrets_attributes => [:name], :owners_attributes => [:req_id])
	end

    

end