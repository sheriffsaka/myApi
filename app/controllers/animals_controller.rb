class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /animals
  def index
    # @animals = Animal.all
    #@animals = Animal.page(1).per(20);
    @animals = Animal.page(params[:page] || 1).per(params[:per_page] || 20);
    
    render json: @animals
  end

  # GET /animals/1
  def show
    render json: @animal
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      # render json: @animal, status: :created, location: @animal
      render json: {status: 'SUCCESS', message: 'Animal created successfully', data: @animal}, status: :ok
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  def update
    if @animal.update(animal_params)
      # render json: @animal
      render json: {status: 'SUCCESS', message: 'Animal Updated successfully', data: @animal}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Animal NOT Updated', data: @animal}, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
    render json: {status: 'SUCCESS', message: 'Animal deleted successfully', data: @animal}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:aname)
    end

    def page
      page ||= params[:page] || 1
    end

    def per_page
        per_page ||= params[:per_page] || 20
    end
end
