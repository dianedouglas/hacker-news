class AddCommentPolymorphism < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer
    add_column :comments, :post_type, :string
    remove_column :comments, :id, :integer
  end
end
