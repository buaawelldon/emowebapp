class Bookmark < ActiveRecord::Base
	#belongs_to :category
	has_attached_file :photo,
	#:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  	#:url => "/system/:attachment/:id/:style/:filename", 
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    #:default_url => "path to default image"
	:url => "/assets/products/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  	#validates_attachment_presence :photo
  	validates_attachment_size :photo, :less_than => 5.megabytes
  	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
