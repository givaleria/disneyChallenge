class Character < ApplicationRecord
    has_many :character_movies
    has_many :movies, through: :character_movies

    validates :image, presence: true
    validates :name, presence: true
    validates :age, presence: true
    validates :weight, presence: true
    validates :history, presence: true
end
