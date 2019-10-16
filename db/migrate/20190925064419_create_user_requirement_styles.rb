class CreateUserRequirementStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requirement_styles do |t|
      t.string :image
      # t.user_requirement_id :integer

      t.timestamps
    end
  end
end
