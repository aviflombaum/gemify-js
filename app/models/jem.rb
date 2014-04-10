class Jem < ActiveRecord::Base
  has_many :scripts

  def create_gem_directory
    `RAILS_ENV="#{Rails.env.to_s}" rails g gemify #{self.id}`
  end
  
end
