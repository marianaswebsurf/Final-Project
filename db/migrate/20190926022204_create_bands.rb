class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.string :region
      t.integer :since
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
