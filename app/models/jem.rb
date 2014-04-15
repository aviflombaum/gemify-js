class Jem < ActiveRecord::Base
  has_many :scripts
  has_many :activities
  belongs_to :user

  def create_gem_directory
    `RAILS_ENV="#{Rails.env.to_s}" rails g gemify #{self.id}`
  end

  def create_github_repository
    client = Octokit::Client.new(:login => ENV["GITHUB_EMAIL"], :password => ENV["GITHUB_PASSWORD"])

    repository = client.create_repository(jem.name, { 
      :description => jem.description, 
      :homepage => jem.homepage,
      :private => false,
      :has_issues => true,
      :has_wiki => true,
      :has_downloads => true
    })

    client.add_collaborator(repository.full_name, ENV['COLLAB_NAME'])

    self.gem_repo = repository.rels[:html].href
    self.save

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
      `gem push "#{self.name}-#{version_number}.gem"`
    end
  end

  def delete_jem_from_directory
    target = File.join(Dir.pwd, "jems")
    Dir.chdir(target) do
      `rm -rf #{self.name}`
    end
  end

  def has_files?
    self.scripts.empty? ? false : true
  end

  def log_rubygems
    Gems.configure do |config|
      config.username = ENV['RUBYGEM_EMAIL']
      config.password = ENV['RUBYGEM_PASSWORD']
    end
  end

  def self.get_message(pct_complete)
    messages = ['Solving World Hunger...', 'Milking Goats...', 'Breeding Corgis...', 'Whipping Developers...', 'Pretending To Gemify...', 'Fermenting Cheese...', 'Asking Logan For Help', 'Crying On Friday', 'Arel Readying Boat']
    if pct_complete == 100
      job_message = 'Gemified!'
    else
      job_message = messages[rand(0..messages.size-1)]
    end
    job_message
  end

  private

    def find_directory
      File.join(Dir.pwd, "jems/#{self.name}")
    end

    def all_repoes
      @client.repositories
    end

  
end
