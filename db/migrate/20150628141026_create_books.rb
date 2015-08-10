class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :detail
      t.string :writer

      t.timestamps null: false
    end
  end
end
