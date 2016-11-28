class Uploadfile < ActiveRecord::Base
  def self.destroy_files(article_id)
    destroy_files = Uploadfile.where(article_id: article_id)
    destroy_files.each do |file|
      Cloudinary::Uploader.destroy(file.public_id, options = {})
    end
    destroy_files.destroy_all
  end
end
