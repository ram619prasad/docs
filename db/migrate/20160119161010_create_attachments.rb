class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :media

      t.timestamps null: false
    end
  end
end
