class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title       #게시글 제목
      t.text    :content     #게시글 내용
      t.string  :member_name #게시글 글쓴이
      t.integer :board_id    #게시글은 게시판에 속해있다
      t.integer :member_id   #게시글은 회원에게 속해있다
      t.timestamps null: false
    end
  end
end
