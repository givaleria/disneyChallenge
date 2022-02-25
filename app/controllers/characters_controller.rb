class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show update destroy ]

  # GET /characters
  def index
    if request.query_string.present?
      if params[:name]
        @character = Character.where(name: params[:name])
        render json: @character.to_json(:include => [:movies])
      elsif params[:age]
        @character = Character.where(age: params[:age])
        render json: @character.to_json(:include => [:movies])
      elsif params[:weight]
        @character = Character.where(weight: params[:weight])
        render json: @character.to_json(:include => [:movies])
      elsif params[:movies]
        @movies = Movie.find(params[:movies])
        render json: @movies.characters.to_json(:include => [:movies])
      end
    else
      @characters = Character.all
      render :json => @characters.to_json( :only => [:image, :name] )
    end
  end

  # GET /characters/1
  def show
    render json: @character.to_json(:include => [:movies])
  end

  # POST /characters
  def create
    @character = Character.new(character_params) 
    if @character.save
    render json: {
      status: 'SUCCESSFUL',
      message: 'New character created',
      data: @character
    }, status: :ok
    else
    render json: {
      status: 'FAILED',
      message: 'The character cannot be created',
      data: @character.errors
    }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    @character = Character.find(params[:id]) 

    if @character.update(character_params)
      render json: {
      status: 'SUCCESSFUL',
      message: 'Character updated',
      data: @character
    }, status: :ok
    else
      render json: {
      status: 'FAILED',
      message: 'The character cannot be updated',
      data: @character.errors
    }, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    @character = Character.find(params[:id]) 
    if @character.destroy
    render json: {
      status: 'SUCCESSFUL',
      message: 'Character has been deleted',
      data: @character
    }, status: :ok
    else
    render json: {
      status: 'FAILED',
      message: 'The character cannot be deleted',
      data: @character.errors
    }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:image, :name, :age, :weight, :history)
    end
end
