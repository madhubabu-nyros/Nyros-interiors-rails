class CreateUserRequirementGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requirement_goals do |t|
      t.text :content

      t.timestamps
    end
  end
end
