class Review < ApplicationRecord
    belongs_to :user
    belongs_to :anime, counter_cache: true
end