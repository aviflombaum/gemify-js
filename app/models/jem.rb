class Jem < ActiveRecord::Base
  has_many :scripts

  validates :name, presence: true, uniqueness: true
  validates :version_number, presence: true
  validates :github, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :summary, presence: true
  validates :home_page, presence: true

end
