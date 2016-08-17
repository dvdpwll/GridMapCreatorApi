class MapsController < ApplicationController
  before_action :set_map, only: [:show, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all

    render json: @maps
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    render json: @map
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    if @map.save
      render json: @map, status: :created, location: @map
    else
      render json: @map.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    @map = Map.find(params[:id])

    if @map.update(map_params)
      head :no_content
    else
      render json: @map.errors, status: :unprocessable_entity
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy

    head :no_content
  end

  private

    def set_map
      @map = Map.find(params[:id])
    end

    def map_params
      params.require(:map).permit(:name)
    end
end
