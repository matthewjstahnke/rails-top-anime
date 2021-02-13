class Anime < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :user
    validates :title, presence: true
    validates :genre, presence: true
    validates :release_year, presence: true
    validates :episode_count, presence: true
    scope :anime_sort, ->(sort) { order(sort) }
end