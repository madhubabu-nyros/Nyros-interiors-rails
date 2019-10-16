class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
