class Upvote < ApplicationRecord
  belongs_to :paper
  belongs_to :user
end
