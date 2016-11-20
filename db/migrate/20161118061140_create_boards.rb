class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string  :route       #게시판 영문 라우팅 이름
      t.string  :name        #게시판 한글 이름
      t.integer :category_id #게시판은 카테고리에 속해있다
      t.boolean :asc         #순서대로 정렬하는지 역순인지
      t.boolean :default     #기본 카테고리인지 여부
      t.timestamps null: false
    end
  end
end
