class CreateMediaDirectories < ActiveRecord::Migration
  def change
    create_table :media_directories do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
