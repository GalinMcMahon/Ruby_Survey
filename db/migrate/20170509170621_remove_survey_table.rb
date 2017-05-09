class RemoveSurveyTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:survey)
  end
end
