class CreateUserRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requirements do |t|
      t.integer :room_id
      t.string :furniture

      t.timestamps
    end
  end
end
