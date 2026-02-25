class Emotion < ApplicationRecord
  has_many :reports, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true
end
