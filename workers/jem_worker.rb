class JemWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  sidekiq_options retry: false

  def perform(jem_id)
    total 100
    jem = Jem.find(jem_id)
    at 5
    ssh_url = jem.create_github_repository
    at 15
    jem.create_gem_directory
    at 35
    jem.push_to_github(ssh_url)
    at 50
    jem.build_gem
    at 75
    jem.delete_jem_from_directory
    at 100
  end  
end