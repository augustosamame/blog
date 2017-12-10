module Blog
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    before_action :merge_abilities

    include Rails.application.routes.url_helpers

    layout "blog/#{Blog.blog_layout}"

    private

    def merge_abilities
      current_ability.merge(Blog::Ability.new(current_user))
    end

  end
end
