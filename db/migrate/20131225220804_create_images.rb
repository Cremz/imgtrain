class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :title
      t.integer :ip
      t.string :delete_code

      t.timestamps
    end
  end
end
