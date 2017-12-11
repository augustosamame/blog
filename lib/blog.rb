require "blog/engine"
require "friendly_id"
require "html_truncator"
require 'carrierwave'
require 'carrierwave/storage/fog'
require 'social-share-button'
require 'ckeditor'

module Blog

  #include Rails.application.routes.url_helpers

  mattr_accessor :show_twitter_sidebar #Can now reference this setting as Blog.show_twitter_sidebar
  mattr_accessor :blog_layout
  mattr_accessor :aws_secret_key

end
