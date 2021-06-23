class Api::V1::CampaignsController < ApplicationController
  def index
    campaign = Campaign.all.order(:title)
    render json: campaign
  end

  def create
    campaign = Campaign.create!(campaign_params)
    if campaign
      render json: campaign
    else 
      render json: campaign.errors
    end
  end

  def show
    if campaign
      render json: campaign
    else
      render json: campaign.errors
    end
  end

  def destroy
    campaign&.destroy
    render json { message: 'Campaign deleted!' }
  end


  private 
  def campaign_params
    params.permit(:title, :party, :level, :c_notes, :dm_notes, :user_id)
  end 

  def campaign
    @campaign || = Campaign.find(params[:id])
  end
end
