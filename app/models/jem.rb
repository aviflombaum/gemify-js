class Jem < ActiveRecord::Base
  mount_uploader :script, ScriptUploader
end
