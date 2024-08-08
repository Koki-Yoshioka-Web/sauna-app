class AddSurveyToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :survey, :json, default: {}
  end
end
