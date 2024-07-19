class Evaluation < ApplicationRecord
    belongs_to :presentation
    belongs_to :user

    validates :points, :feedback, presence: true
end
