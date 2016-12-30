class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :route, null:false          #영문 라우팅 이름
      t.string  :name, null:false           #한글 카테고리 이름
      t.string  :default, default:nil       #기본 카테고리인지 여부/아니라면 리다이렉트할 url이 담김
      t.integer :read_level, default:0, null:false
      t.timestamps null: false
    end
  end
end
