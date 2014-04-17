class UpdateJemWorker
  include Sidekiq::Worker
  include SidekiqStatus::Worker
  sidekiq_options retry: false

  def perform(jem_id)
    self.total = 100
    at 0
    jem = Jem.find(jem_id)
    at 5
    ssh_url = jem.ssh_url
    at 30
    jem.create_gem_directory
    at 45
    jem.grab_git_file_from_clone
    at 55
    jem.update_push_to_github(ssh_url)
    at 85
    jem.build_gem
    at 95
    jem.delete_jem_from_directory
    at 100
  end

end