class Report < ApplicationRecord
  belongs_to :user
  belongs_to :emotion
  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :emotion, presence: true

  has_one_attached :image

  # Ransack 検索設定
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "emotion_id", "id", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["emotion", "tags"]
  end
end
