require "blog/engine"
require "friendly_id"
require "html_truncator"
require 'carrierwave'
require 'carrierwave/storage/fog'
require 'social-share-button'

module Blog

  #include Rails.application.routes.url_helpers

  mattr_accessor :show_twitter_sidebar #Can now reference this setting as Blog.show_twitter_sidebar
  mattr_accessor :blog_layout

  # Your code goes here...
end
