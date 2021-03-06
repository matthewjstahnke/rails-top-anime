class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :created_animes, class_name: "Anime", foreign_key: "user_id"
    has_many :animes, through: :reviews
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 7, message:"Must be at least 7 characters long."}
end
