require 'open-uri'

class GemifyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_files
    @jem = Jem.find(name.to_i)

    target = File.join(Dir.pwd, "jems_tmp/#{@jem.name}")
    puts target

    template "engine.rb.erb", File.join(target, "lib/#{@jem.name}/engine.rb")
    template "version.rb.erb", File.join(target, "lib/#{@jem.name}/version.rb")
    template "railtie.rb.erb", File.join(target, "lib/#{@jem.name}/railtie.rb")
    template "railsloader.rb.erb", File.join(target, "lib/#{@jem.name}.rb")
    template "gemspec.rb.erb", File.join(target, "#{@jem.name}.gemspec")
    template "README.md.tt", File.join(target, "README.md")

    javascript_dir = File.join(target, "vendor/assets/javascripts")
    css_dir = File.join(target, "vendor/assets/stylesheets")
    image_dir = File.join(target, "vendor/assets/images")

    puts "directories for files are:"
    puts javascript_dir
    puts css_dir
    puts image_dir
    
    empty_directory javascript_dir
    empty_directory css_dir
    empty_directory image_dir

    @jem.scripts.each do |script|
      script_url = script.file_url
      puts "file_url is: " + script_url

      extension = script.file.file.extension
      puts "extension is: " + script_url
     
      if extension == 'js'
        target = javascript_dir + "/" + File.basename(script_url)
        puts "js target location: " + target
        download_file(script_url, target)
      elsif extension == 'css'
        target = css_dir + "/" + File.basename(script_url)
        puts "css target location: " + target
        download_file(script_url, target)
      else
        target = image_dir + "/" + File.basename(script_url)
        puts "image target location: " + target
        download_file(script_url, target)
      end

    end
  end

  private

  def module_name
    @jem = Jem.find(name.to_i)
    @jem.name.gsub(/-|_/, '').capitalize
  end

  def download_file(download_url, target)
    File.open(target, "wb") do |saved_file|
      open(download_url, "rb") do |read_file|
        saved_file.write(read_file.read)
      end
    end
  end
  
end
