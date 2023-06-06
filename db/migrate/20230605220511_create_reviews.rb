class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :picture
      t.string :comment
      t.references :eatery, foreign_key: true

      t.timestamps
    end
  end
end
