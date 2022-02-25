class Movie < ApplicationRecord
  belongs_to :genre
  has_many :character_movies
  has_many :characters, through: :character_movies
end
