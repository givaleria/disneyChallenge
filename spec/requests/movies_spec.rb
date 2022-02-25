require 'rails_helper'

RSpec.describe "Movies", type: :request do
  it 'returns all movies'do
    get '/movies'

    expect(response).to have_http_status(:success)
  end

  it 'creates a new movie' do
    post '/genres', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller'}} 
   
    post '/movies', :params => { :movie => {:image => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTgp6BE6OJMuIALQiSmwa1GRiLZ3V6oR6V-B45qObhe-AHtlAUo', :title => 'The New Mutants', :date => '2022/05/01', :mark => 3, :genre_id => 1}} 

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)
    expect(response.body).to include 'New movie created'
  end

  it 'delete a movie' do
    post '/genres', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller'}} 
   
    post '/movies', :params => { :movie => {:image => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTgp6BE6OJMuIALQiSmwa1GRiLZ3V6oR6V-B45qObhe-AHtlAUo', :title => 'The New Mutants', :date => '2022/05/01', :mark => 3, :genre_id => 1}} 

    delete '/movies/1'

    expect(response).to have_http_status(:success)
    expect(response.body).to include 'Movie has been deleted'
  end

  it 'update a movie' do
    post '/genres', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller'}} 
   
    post '/movies', :params => { :movie => {:image => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTgp6BE6OJMuIALQiSmwa1GRiLZ3V6oR6V-B45qObhe-AHtlAUo', :title => 'The New Mutants', :date => '2022/05/01', :mark => 3, :genre_id => 1}} 

    patch '/movies/1', :params => { :movie => {:image => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTgp6BE6OJMuIALQiSmwa1GRiLZ3V6oR6V-B45qObhe-AHtlAUo', :title => 'The New Mutants', :date => '2022/05/01', :mark => 4, :genre_id => 1}} 

    expect(response).to have_http_status(:success)
    expect(response.body).to include 'Movie updated'
  end

  it 'it shouldnt be able to create a movie without a genre_id' do
    post '/genres', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller'}} 
   
    post '/movies', :params => { :movie => {:image => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTgp6BE6OJMuIALQiSmwa1GRiLZ3V6oR6V-B45qObhe-AHtlAUo', :title => 'The New Mutants', :date => '2022/05/01', :mark => 3}} 
   
    expect(response).to have_http_status(422)
    expect(response.body).to include 'The movie cannot be created'
 end

end
