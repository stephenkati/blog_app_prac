class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_likes_num

  private

  def update_likes_num
    post.increment!(:likes_counter)
  end
end

