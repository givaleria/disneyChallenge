class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show update destroy ]

  # GET /genres - Obtain all genres loaded order by id
  def index
    @genres = Genre.order('id') 
    render json: {
      status: 'SUCCESSFUL',
      message: 'Genres loaded successfully',
      data: @genres
    }, status: :ok
  end

  # GET /genres/1 - Obtain a genre by id 
  def show
    render json: @genre
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params) 
    if @genre.save
    render json: {
      status: 'SUCCESSFUL',
      message: 'New genre created',
      data: @genre
    }, status: :ok
    else
    render json: {
      status: 'FAILED',
      message: 'The genre cannot be created',
      data: @genre.errors
    }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
    @genre = Genre.find(params[:id]) 

    if @genre.update(genre_params)
      render json: {
      status: 'SUCCESSFUL',
      message: 'Genre updated',
      data: @genre
    }, status: :ok
    else
      render json: {
      status: 'FAILED',
      message: 'The genre cannot be updated',
      data: @genre.errors
    }, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    @genre = Genre.find(params[:id]) 
    if @genre.destroy
    render json: {
      status: 'SUCCESSFUL',
      message: 'Genre has been deleted',
      data: @genre
    }, status: :ok
    else
    render json: {
      status: 'FAILED',
      message: 'The genre cannot be deleted',
      data: @genre.errors
    }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:image, :name)
    end
end
