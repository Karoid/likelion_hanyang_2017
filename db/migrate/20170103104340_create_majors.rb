class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string   :name, :null => false
      t.string   :department, :null => false
    end
  end
end
