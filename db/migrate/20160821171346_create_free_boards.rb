class CreateFreeBoards < ActiveRecord::Migration
  def change
    create_table :free_boards do |t|
      t.string  :title
      t.text    :content
      t.integer :member_id
      t.timestamps null: false
    end
  end
end
