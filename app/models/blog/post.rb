module Blog
  class Post < ApplicationRecord
    belongs_to :user

    mount_uploader :post_image, Blog::PostImageUploader

    acts_as_taggable_on :tags

    after_initialize do |post|
      post.publication_date ||= Time.current.to_datetime if new_record?
    end

    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    enum status: { active: 0, inactive: 1 }
    enum post_type: { standard: 0, video: 1 }


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
