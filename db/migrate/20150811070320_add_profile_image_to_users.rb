class AddProfileImageToUsers < ActiveRecord::Migration
  def change
    add_column :books, :profile_image_id, :string
  end
end
