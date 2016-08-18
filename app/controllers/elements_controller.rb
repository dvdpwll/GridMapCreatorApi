# jdkvlsv ApplicationController     OpenReadController
class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :update, :destroy]

  # GET /elements
  # GET /elements.json
  def index
    @elements = Map.find(params[:map_id]).elements
    # @maps = User.find(params[:user_id]).maps
    # @elements = Element.all

    render json: @elements
  end

  # GET /elements/1
  # GET /elements/1.json
  def show
    render json: @element
  end

  # POST /elements
  # POST /elements.json
  def create
    # @element = current_map.elements.build(element_params)
    @element = Element.new(element_params)
    # @map = current_user.maps.build(map_params)

    if @element.save
      render json: @element, status: :created, location: @element
    else
      render json: @element.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /elements/1
  # PATCH/PUT /elements/1.json
  def update
    @element = Element.find(params[:id])
    # @map = current_user.maps.build(map_params)

    if @element.update(element_params)
      head :no_content
    else
      render json: @element.errors, status: :unprocessable_entity
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.json
  def destroy
    @element.destroy

    head :no_content
  end

  private

  def set_element
    # @element = current_map.elements.find(params[:id])
    @element = Element.find(params[:id])
    # @map = current_user.maps.find(params[:id])
  end

  def element_params
    params.require(:element).permit(:thing, :order, :map_id)
  end
end
