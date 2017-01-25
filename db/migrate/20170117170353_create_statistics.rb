class CreateStatistics < ActiveRecord::Migration
#이 DB는 통계치로 활용되는 DB입니다.
#각 상황별 name에 들어갈 값
#사이트 출석  > sign_in
#글 열람     > read_article
#행사 출석   > attend_event
#.......................... 추가시 작성 요망
# create를 이용하여 작성하셔야 합니다.
  def change
    create_table :statistics do |t|
      t.string :name, :null => false
      t.integer :member_id, :null => false
      t.string :target_model
      t.integer :target_id
      t.date :created_at, null: false
    end
  end
end
