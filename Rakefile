# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :yank_all_gems => :environment do
  jems = Jem.all.pluck(:name, :version_number)
  selective_jems = jems.select { |jem| jem.last.to_i != 0 }
  selective_jems.each do |jem|
  	puts "yanking #{jem.first}"
    `gem yank #{jem.first} -v #{jem.last}`
  end
end