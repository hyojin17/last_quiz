class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :nationality
      t.string :image

      t.timestamps
    end
  end
end
