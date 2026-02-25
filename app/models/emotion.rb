class Emotion < ApplicationRecord
  has_many :reports, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true

  # Ransack 検索設定
  def self.ransackable_attributes(auth_object = nil)
    ["color", "created_at", "id", "name", "updated_at"]
  end
end
