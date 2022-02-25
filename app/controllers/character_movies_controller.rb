class CharacterMoviesController < ApplicationController
  before_action :set_character_movie, only: %i[ show update destroy ]

  # GET /character_movies
  def index
    @character_movies = CharacterMovie.all

    render json: @character_movies
  end

  # GET /character_movies/1
  def show
    render json: @character_movie
  end

  # POST /character_movies
  def create
    @character_movie = CharacterMovie.new(character_movie_params)

    if @character_movie.save
      render json: @character_movie, status: :created, location: @character_movie
    else
      render json: @character_movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /character_movies/1
  def update
    if @character_movie.update(character_movie_params)
      render json: @character_movie
    else
      render json: @character_movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /character_movies/1
  def destroy
    @character_movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_movie
      @character_movie = CharacterMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_movie_params
      params.require(:character_movie).permit(:character_id, :movie_id)
    end
end
