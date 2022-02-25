require 'rails_helper'

RSpec.describe "Genres", type: :request do
  it 'returns all genres'do
    get '/genres'

    expect(response).to have_http_status(:success)
    expect(response.body).to include 'Genres loaded successfully'
  end

  it 'creates a new genre' do
    post '/genres', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller'}} 

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)
    expect(response.body).to include 'New genre created'
  end

  it 'delete a genre' do
    post '/genres', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller'}} 

    delete '/genres/1'

    expect(response).to have_http_status(:success)
    expect(response.body).to include 'Genre has been deleted'
  end

  it 'update a genre' do
    post '/genres', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller'}} 
    
    patch '/genres/1', :params => { :genre => {:image => 'https://creamundi.es/wp-content/uploads/2018/10/thriller.jpg', :name => 'Thriller2'}} 
  
    expect(response).to have_http_status(:success)
    expect(response.body).to include 'Genre updated'
  end

end

