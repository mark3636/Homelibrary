class PublishingHousesController < ApplicationController
  before_action :set_publishing_house, only: [:edit, :update, :destroy]

  # GET /publishing_houses
  # GET /publishing_houses.json
  def index
    publishing_houses_scope = PublishingHouse.all
    publishing_houses_scope = publishing_houses_scope.like(params[:filter]) if params[:filter]
    @publishing_houses = smart_listing_create(:publishing_houses,
                                              publishing_houses_scope,
                                              partial: "publishing_houses/list"
                                             )
  end


  # GET /publishing_houses/new
  def new
    @publishing_house = PublishingHouse.new
  end

  # GET /publishing_houses/1/edit
  def edit
  end

  # POST /publishing_houses
  # POST /publishing_houses.json
  def create
    @publishing_house = PublishingHouse.new(publishing_house_params)
    @publishing_house.save
  end

  # PATCH/PUT /publishing_houses/1
  # PATCH/PUT /publishing_houses/1.json
  def update
    @publishing_house.update(publishing_house_params)
  end

  # DELETE /publishing_houses/1
  # DELETE /publishing_houses/1.json
  def destroy
    @publishing_house.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publishing_house
      @publishing_house = PublishingHouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publishing_house_params
      params.fetch(:publishing_house, {}).permit(:name)
    end
end
