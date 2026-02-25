class AddFieldsToReports < ActiveRecord::Migration[8.1]
  def change
    add_column :reports, :title, :string
    add_column :reports, :content, :text
    add_column :reports, :emotion_id, :integer
    add_column :reports, :user_id, :integer
  end
end
