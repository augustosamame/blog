$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog"
  s.version     = Blog::VERSION
  s.authors     = ["Augusto Samame"]
  s.email       = ["augusto@devtechperu.com"]
  s.homepage    = "https://www.devtechperu.com"
  s.summary     = "Rails blog engine for use in DevTechPeru projects"
  s.description = "Description of Blog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'dotenv-rails'
  s.add_dependency 'kaminari'#, "~> 1.1.1"
  s.add_dependency 'friendly_id'#, '~> 5.1.0'
  s.add_dependency "html_truncator"#, "~>0.2"
  s.add_dependency 'carrierwave'#, '~> 1.2.1'
  s.add_dependency 'fog-aws'#, '~> 1.4.1'
  s.add_dependency 'mini_magick'#, '~> 4.8.0'
  s.add_dependency 'social-share-button'
  s.add_dependency 'ckeditor'
  s.add_dependency 'meta-tags'
  s.add_dependency "font-awesome-rails"
  s.add_dependency 'simple_form'

  s.add_development_dependency "pg"
end
