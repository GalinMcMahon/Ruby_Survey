class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |q|
      q.column(:prompt, :string)
      q.column(:answer1, :string)
      q.column(:answer2, :string)
      q.column(:answer3, :string)
      q.column(:answer4, :string)
      q.column(:survey_id, :int)

      q.timestamps
    end
  end
end
