class UpdateJemWorker
  include Sidekiq::Worker
  include SidekiqStatus::Worker
  sidekiq_options retry: false

  def perform(jem_id)
    self.total = 100
    at 0
    jem = Jem.find(jem_id)
    at 5
    ssh_url = jem.ssh_url.nil? ? jem.get_ssh_url : jem.ssh_url
    at 30
    jem.create_gem_directory
    at 45
    jem.push_to_github(ssh_url)
    at 85
    jem.build_gem
    at 95
    jem.delete_jem_from_directory
    at 100
  end

end