class Tag < ApplicationRecord
  has_many :report_tags, dependent: :destroy
  has_many :reports, through: :report_tags

  validates :name, presence: true, uniqueness: true

  # Ransack 検索設定
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
