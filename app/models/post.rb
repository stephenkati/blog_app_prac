class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to:0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to:0 }

  after_save :update_posts_number
  after_destroy :update_posts_number

  def latest_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private
  def update_posts_number
    destroyed? ? author.decrement!(:posts_counter) : author.increment!(:posts_counter)
  end
end
