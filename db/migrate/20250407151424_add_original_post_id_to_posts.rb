class AddOriginalPostIdToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :original_post_id, :integer
  end
end
