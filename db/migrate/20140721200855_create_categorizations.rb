class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :category, null: false
      t.belongs_to :kitten, null: false
      t.index [:kitten_id, :category_id], unique: true
    end
  end
end
