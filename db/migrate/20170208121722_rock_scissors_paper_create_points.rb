class RockScissorsPaperCreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      ## Database authenticatable
      t.integer :user_id,              null: false
      t.integer :point,                null: false, default: 5000
      t.integer :win,                null: false, default: 0
      t.integer :lose,                null: false, default: 0



      t.timestamps null: false
    end

  end
end
