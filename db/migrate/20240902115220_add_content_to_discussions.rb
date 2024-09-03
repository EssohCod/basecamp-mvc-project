class AddContentToDiscussions < ActiveRecord::Migration[7.1]
  def change
    add_column :discussions, :content, :text
  end
end
