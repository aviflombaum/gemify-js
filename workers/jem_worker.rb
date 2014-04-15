class JemWorker
  include Sidekiq::Worker
  include SidekiqStatus::Worker
  sidekiq_options retry: false

  def perform(jem_id)
    self.total = 100
    at 0
    jem = Jem.find(jem_id)
    at 10
    ssh_url = jem.create_github_repository
    at 35
    jem.create_gem_directory
    at 45
    jem.push_to_github(ssh_url)
    at 60
    jem.build_gem
    at 80
    jem.delete_jem_from_directory
    at 100
  end

end