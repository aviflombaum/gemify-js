class Jem < ActiveRecord::Base
  has_many :scripts
  belongs_to :user

  def create_gem_directory
    
    `RAILS_ENV="#{Rails.env.to_s}" rails g gemify #{self.id}`
  end

  def create_git_repository
    client = Octokit::Client.new(:login => ENV["GITHUB_EMAIL"], :password => ENV["GITHUB_PASSWORD"])

    repository = client.create_repository(self.name, { 
      :description => self.description, 
      :homepage => self.homepage,
      :private => false,
      :has_issues => true,
      :has_wiki => true,
      :has_downloads => true
    })

    client.add_collaborator(repository.full_name, 'sunwooz')

    target = find_directory

    Dir.chdir(target) do
      `git init`
      `git add .`
      `git commit -m "first commit"`
      `git remote add #{self.name} #{repository.ssh_url}`
      `git push #{self.name} master`
      `git remote remove #{self.name}`
    end

    # Dir.chdir(target) do
    #   Rugged::Repository.init_at('.', :bare)
    #   repo = Rugged::Repository.new('.')
    # end
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
