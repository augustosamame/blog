module Blog
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    before_action :merge_abilities
    before_action :hide_header_ecommerce_items if Blog.use_ecommerce_header

    include Rails.application.routes.url_helpers

    layout "blog/#{Blog.blog_layout}"

    private

    def merge_abilities
      current_ability.merge(Blog::Ability.new(current_user))
    end

    def hide_header_ecommerce_items
      @hide_header_ecommerce_items = true
    end

  end
end
