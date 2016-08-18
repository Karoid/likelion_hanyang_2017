class CreateIntroduces < ActiveRecord::Migration
  def change
    create_table :introduces do |t|
      t.string :usage
      t.text :content
      t.timestamps null: false
    end
  end
end
