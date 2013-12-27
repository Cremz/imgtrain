class Image < ActiveRecord::Base
	mount_uploader :image, ImageUploader
  before_create :default_name
  
  def default_name
    self.title ||= File.basename(image.filename, '.*').titleize if image
  end	
end
