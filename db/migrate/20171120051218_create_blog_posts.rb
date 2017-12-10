class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :post_image
      t.text :body
      t.references :user, foreign_key: true
      t.integer :status
      t.integer :post_type
      t.boolean :post_public
      t.boolean :post_published
      t.integer :numComments
      t.datetime :publication_date
      t.string :author

      t.timestamps
    end
  end
end
