class Uploadfile < ActiveRecord::Base
  def self.modelfinder(model)
    if model == 'introduce/history' || model == 'introduce/staff' || model == 'introduce/song' || model == 'introduce/rules'
      Introduce
    elsif model == 'board/notice'
      NoticeBoard
    elsif model == 'board/free'
      FreeBoard
    elsif model == 'board/member'
      MemberBoard
    elsif model == 'board/graduate'
      GraduateBoard
    elsif model =~ /^board\/[0-9]+(\%7C[0-9]+)*/
      SameageBoard
    else
      model
    end
  end

  def self.modelnumber(model)
    model = Uploadfile.modelfinder(model)
    if model == Introduce
      0
    elsif model == NoticeBoard
      1
    elsif model == FreeBoard
      2
    elsif model == MemberBoard
      3
    elsif model == GraduateBoard
      4
    elsif model == SameageBoard
      5
    end
  end
  def self.modelid(model,model_id)
    model = Uploadfile.modelfinder(model)
    if model_id == 0
      model.maximum(:id).to_i.next
    else
      1
    end
  end
  def self.destroy_files(model_id,model) #model_id: 모델상의 id값, model: 모델 그 자체
    destroy_files = Uploadfile.where(model_number: Uploadfile.modelnumber(model), model_id: model_id)
    puts Uploadfile.modelnumber(model)
    puts model_id
    destroy_files.each do |file|
      Cloudinary::Uploader.destroy(file.public_id, options = {})
    end
    destroy_files.destroy_all
  end
end
