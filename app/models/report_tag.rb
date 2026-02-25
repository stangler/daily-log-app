class ReportTag < ApplicationRecord
  belongs_to :report
  belongs_to :tag

  validates :report_id, uniqueness: { scope: :tag_id }
end
