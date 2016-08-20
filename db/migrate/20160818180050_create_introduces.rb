class CreateIntroduces < ActiveRecord::Migration
  def change
    create_table :introduces do |t|
      t.string :usage
      t.string :title
      t.text :content
      t.integer :member_id
      t.timestamps null: false
    end
  end
end
