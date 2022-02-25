require 'rails_helper'

RSpec.describe "Characters", type: :request do
  it 'returns all characters'do
    get '/characters'

    expect(response).to have_http_status(:success)
  end

  it 'creates a new character' do
    post '/characters', :params => {:character => {:image => 'https://www.muycomputer.com/wp-content/uploads/2021/08/Spider-Man.jpg', :name => 'Spiderman', :age => 38, :weight => 80, :history => 'Your friendly neighborhood Spiderman'}} 

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)
    expect(response.body).to include 'New character created'
  end

  it 'delete a character' do
    post '/characters', :params => {:character => {:image => 'https://www.muycomputer.com/wp-content/uploads/2021/08/Spider-Man.jpg', :name => 'Spiderman', :age => 38, :weight => 80, :history => 'Your friendly neighborhood Spiderman'}} 

    delete '/characters/1'

    expect(response).to have_http_status(:success)
    expect(response.body).to include 'Character has been deleted'
  end

  it 'update a character' do
    post '/characters', :params => {:character => {:image => 'https://www.muycomputer.com/wp-content/uploads/2021/08/Spider-Man.jpg', :name => 'Spiderman', :age => 38, :weight => 80, :history => 'Your friendly neighborhood Spiderman'}} 
    
    patch '/characters/1', :params => {:character => {:image => 'https://www.muycomputer.com/wp-content/uploads/2021/08/Spider-Man.jpg', :name => 'The Amazing Spiderman', :age => 38, :weight => 80, :history => 'Your friendly neighborhood Spiderman'}} 
  
    expect(response).to have_http_status(:success)
    expect(response.body).to include 'Character updated'
  end

  it 'it shouldnt be able to create a character without a param' do
    post '/characters', :params => {:character => {:image => 'https://www.muycomputer.com/wp-content/uploads/2021/08/Spider-Man.jpg', :name => 'Spiderman', :weight => 80, :history => 'Your friendly neighborhood Spiderman'}} 

    expect(response).to have_http_status(422)
    expect(response.body).to include 'The character cannot be created'
  end

end