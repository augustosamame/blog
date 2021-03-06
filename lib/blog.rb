require "blog/engine"
require "friendly_id"
require "html_truncator"
require 'carrierwave'
require 'carrierwave/storage/fog'
require 'mini_magick'
require 'social-share-button'
require 'ckeditor'
require 'meta-tags'

module Blog

  #include Rails.application.routes.url_helpers

  mattr_accessor :show_twitter_sidebar #Can now reference this setting as Blog.show_twitter_sidebar
  mattr_accessor :use_main_app_header
  mattr_accessor :use_main_app_footer
  mattr_accessor :use_main_app_javascripts
  mattr_accessor :use_engine_header
  mattr_accessor :use_engine_footer
  mattr_accessor :use_ecommerce_footer
  mattr_accessor :use_ecommerce_header
  mattr_accessor :twitter_handle
  mattr_accessor :blog_layout
  mattr_accessor :aws_secret_key
  mattr_accessor :aws_access_key
  mattr_accessor :s3_bucket
  mattr_accessor :blog_facebook_comments_app_id
  mattr_accessor :site_name

end
