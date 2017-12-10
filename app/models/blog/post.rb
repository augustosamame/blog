module Blog
  class Post < ApplicationRecord
    belongs_to :user

    mount_uploader :post_image, Blog::PostImageUploader

    acts_as_taggable_on :tags

    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged


    def slug_candidates
      [
        :title,
        [:title, :publication_date],
        [:title, :publication_date, :id]
      ]
    end

    def previous_post
      self.class.where("publication_date < ?", self.publication_date).order(publication_date: :desc).first
    end

    def next_post
      self.class.where("publication_date > ?", self.publication_date).order(publication_date: :desc).first
    end

  end
end
