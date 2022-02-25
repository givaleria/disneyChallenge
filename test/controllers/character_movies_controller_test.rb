require "test_helper"

class CharacterMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_movie = character_movies(:one)
  end

  test "should get index" do
    get character_movies_url, as: :json
    assert_response :success
  end

  test "should create character_movie" do
    assert_difference("CharacterMovie.count") do
      post character_movies_url, params: { character_movie: { character_id: @character_movie.character_id, movie_id: @character_movie.movie_id } }, as: :json
    end

    assert_response :created
  end

  test "should show character_movie" do
    get character_movie_url(@character_movie), as: :json
    assert_response :success
  end

  test "should update character_movie" do
    patch character_movie_url(@character_movie), params: { character_movie: { character_id: @character_movie.character_id, movie_id: @character_movie.movie_id } }, as: :json
    assert_response :success
  end

  test "should destroy character_movie" do
    assert_difference("CharacterMovie.count", -1) do
      delete character_movie_url(@character_movie), as: :json
    end

    assert_response :no_content
  end
end
