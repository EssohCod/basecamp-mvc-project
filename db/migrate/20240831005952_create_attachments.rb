class CreateAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :file_type
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
