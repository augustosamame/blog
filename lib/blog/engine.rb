require 'dotenv-rails'
Dotenv.load('.env')

module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog
    engine_name 'blog'
  end
end

begin
  require 'jquery-rails'
rescue LoadError
  puts "Ecommerce::Engine error: Please add the jquery-rails gem to your main application's Gemfile. The Ecommerce engine needs it in order to work properly."
  exit
end

begin
  require 'jquery-ui-rails'
rescue LoadError
  puts "Ecommerce::Engine error: Please add the jquery-ui-rails gem to your main application's Gemfile. The Ecommerce engine needs it in order to work properly."
  exit
end

begin
  require 'bootstrap-sass'
rescue LoadError
  puts "Ecommerce::Engine error: Please add the bootstrap-sass gem to your main application's Gemfile. The Ecommerce engine needs it in order to work properly."
  exit
end
