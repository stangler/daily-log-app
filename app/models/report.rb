class Report < ApplicationRecord
  belongs_to :user
  belongs_to :emotion
  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :emotion, presence: true

  has_one_attached :image
end
