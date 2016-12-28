class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string  :route,     null: false     #게시판 영문 라우팅 이름
      t.string  :name,      null: false     #게시판 한글 이름
      t.integer :category_id                #게시판은 카테고리에 속해있다
      t.string  :template,  default: nil    #기본 템플릿인지 여부
      t.boolean :show_last, default: false  #가장 최근의 글을 보이는지 여부
      t.boolean :show_comment, default: true#댓글 작성 가능 여부

      t.integer :read_level, default:0
      t.integer :write_level, default:100
      t.timestamps null: false
    end
  end
end
