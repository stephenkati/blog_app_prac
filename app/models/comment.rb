class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_comments_num

  private

  def update_comments_num
    post.increment!(:comments_counter)
  end
end
