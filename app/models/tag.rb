class Tag < ApplicationRecord
  has_many :report_tags, dependent: :destroy
  has_many :reports, through: :report_tags

  validates :name, presence: true, uniqueness: true
end
