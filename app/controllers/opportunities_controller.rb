class OpportunitiesController < ApplicationController

    def index
      @opportunities = Opportunity.all
    end

    def new

    end

    def create
      Opportunity.create(title: params[:opportunity][:title], circumstance: params[:opportunity][:circumstance])
      redirect_to opportunities_path
    end 

    def show
      @opportunity = Opportunity.find(params[:id])
    end


end
