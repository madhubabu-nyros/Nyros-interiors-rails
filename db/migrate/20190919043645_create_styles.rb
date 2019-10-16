class CreateStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :styles do |t|
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
