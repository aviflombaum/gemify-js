class Script < ActiveRecord::Base
  belongs_to :jem
  mount_uploader :file, ScriptUploader
  
  validates :file, 
    :presence => true, 
    :file_size => { 
      :maximum => 0.5.megabytes.to_i 
    }
end
