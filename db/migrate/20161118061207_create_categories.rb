class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :route    #영문 라우팅 이름
      t.string :name     #한글 카테고리 이름
      t.boolean :default #기본 카테고리인지 여부
      t.timestamps null: false
    end
  end
end
