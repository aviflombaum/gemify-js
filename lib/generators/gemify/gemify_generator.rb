class GemifyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_files
    @jem = Jem.find(name.to_i)
    target = File.join(Dir.pwd, "jems/#{@jem.name}")
    script_target = File.join(Dir.pwd, "public")
    template "engine.rb.erb", File.join(target, "lib/#{@jem.name}/engine.rb")
    template "version.rb.erb", File.join(target, "lib/#{@jem.name}/version.rb")
    template "railtie.rb.erb", File.join(target, "lib/#{@jem.name}/railtie.rb")
    template "railsloader.rb.erb", File.join(target, "lib/#{@jem.name}.rb")
    template "gemspec.rb.erb", File.join(target, "#{@jem.name}.gemspec")
    template "README.md.tt", File.join(target, "README.md")

    javascript_dir = File.join(target, "vendor/assets/javascripts")
    css_dir = File.join(target, "vendor/assets/stylesheets")
    image_dir = File.join(target, "vendor/assets/images")
    empty_directory javascript_dir
    empty_directory css_dir
    empty_directory image_dir

    @jem.scripts.each do |script|
        script_url = script.file.url
        if script.file.file.extension == 'js'
            copy_file(File.join(script_target, "#{script_url}"), javascript_dir + "/" + File.basename(script_url))
        elsif script.file.file.extension == 'css'
            copy_file(File.join(script_target, "#{script_url}"), css_dir + "/" + File.basename(script_url))
        end
    end

  end
  
end
