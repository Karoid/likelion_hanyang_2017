class CreateUploadfiles < ActiveRecord::Migration
  def change
    create_table :uploadfiles do |t|
      t.string :pubilc_id
      t.string :format
      t.string :resource_type
      t.string :url
      t.timestamps null: false
    end
  end
end
