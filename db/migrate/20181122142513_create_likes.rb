class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :article, foreign_key: true #foreign_key: true가 여기 쓰여있어서 like.rb파일에 validate를 써주지 않아도 된다.

      # t.timestamps
    end
  end
end
