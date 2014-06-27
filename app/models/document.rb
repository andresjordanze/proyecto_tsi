class Document < ActiveRecord::Base

	attr_accessible :archive

	has_attached_file :archive, 
		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),	 	
  	validates_attachment_content_type :archive, :content_type => /\Aimage\/.*\Z/

end