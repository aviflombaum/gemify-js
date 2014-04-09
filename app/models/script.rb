class Script < ActiveRecord::Base
  belongs_to :jem
  mount_uploader :file, ScriptUploader
end
