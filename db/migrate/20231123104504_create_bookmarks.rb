class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.string :comment
      t.references :movie, foreign_key: true, null: false
      t.references :list,  foreign_key: true, null: false

      t.timestamps
    end
  end
end
