class Tag < ApplicationRecord
  has_many :report_tags, dependent: :destroy
  has_many :reports, through: :report_tags
end
