class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :update, :destroy]

  # GET /elements
  # GET /elements.json
  def index
    @elements = Element.all

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
    @element = Element.new(element_params)

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
      @element = Element.find(params[:id])
    end

    def element_params
      params.require(:element).permit(:thing, :order, :map_id)
    end
end
