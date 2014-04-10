# -*- encoding: utf-8 -*-
# stub: google-analytics-rails 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "google-analytics-rails"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Benoit Garret"]
  s.date = "2014-03-02"
  s.description = "Rails 3 helpers to manage google analytics tracking"
  s.email = ["benoit.garret@gadz.org"]
  s.homepage = "https://github.com/bgarret/google-analytics-rails"
  s.rubyforge_project = "google-analytics-rails"
  s.rubygems_version = "2.2.1"
  s.summary = "Rails 3 helpers to manage google analytics tracking"

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, ["~> 3.0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
  end
end
