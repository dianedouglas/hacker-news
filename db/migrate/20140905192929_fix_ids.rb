class FixIds < ActiveRecord::Migration
  def change
    add_column :comments, :id, :primary_key
    remove_column :comments, :link_id, :integer
  end
end
