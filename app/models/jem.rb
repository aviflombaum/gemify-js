class Jem < ActiveRecord::Base
  has_many :scripts
  belongs_to :user

  def create_gem_directory
    `RAILS_ENV="#{Rails.env.to_s}" rails g gemify #{self.id}`
  end

  def create_github_repository
    client = Octokit::Client.new(:login => ENV["GITHUB_EMAIL"], :password => ENV["GITHUB_PASSWORD"])

    repository = client.create_repository(self.name, { 
      :description => self.description, 
      :homepage => self.homepage,
      :private => false,
      :has_issues => true,
      :has_wiki => true,
      :has_downloads => true
    })

    client.add_collaborator(repository.full_name, ENV['COLLAB_NAME'])

    self.github = repository.html_url
    repository.ssh_url
  end

  def push_to_github(ssh_url)
    target = find_directory

    Dir.chdir(target) do
      g = Git.init('.')
      g.add
      g.commit('initial commit')
      g.add_remote(self.name, ssh_url)
      g.push(g.remote(self.name))
      g.remote(self.name).remove
    end
  end

  def build_gem
    target = find_directory

    Gems.configure do |config|
      config.username = ENV['RUBYGEM_EMAIL']
      config.password = ENV['RUBYGEM_PASSWORD']
    end

    Dir.chdir(target) do
      `gem build #{self.name}.gemspec`
      `curl -H 'Authorization:#{Gems.api_key}' https://rubygems.org/api/v1/some_api_call.json`
      Gems.push File.new "#{self.name}-#{version_number}.gem"
    end
  end

  def has_files?
    self.scripts.empty? ? false : true
  end

  private

    def find_directory
      File.join(Dir.pwd, "jems/#{self.name}")
    end

    def all_repoes
      @client.repositories
    end

  
end
