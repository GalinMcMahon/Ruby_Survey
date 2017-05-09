class CreateSurvey < ActiveRecord::Migration[5.1]
  def change
    create_table(:survey) do |s|
      s.column(:title, :string)

      s.timestamps
    end
  end
end
