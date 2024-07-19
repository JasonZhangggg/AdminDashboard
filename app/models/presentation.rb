class Presentation < ApplicationRecord
    belongs_to :user
    has_many :evaluations, dependent: :destroy

    validates :title, :description, :date, presence: true
end
