class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_comments_num

  private

  def update_comments_num
    post.increment!(:comments_counter)
  end
end

Comment.create(post: first_post, author: second_user, text: 'Thanks for posting' )
Comment.create(post: second_post, author: first_user, text: 'Love this post!' )
Comment.create(post: second_post, author: first_user, text: 'Good idea' )
Comment.create(post: fourth_post, author: second_user, text: 'I agree' )
Comment.create(post: fourth_post, author: second_user, text: 'I had fun there too!' )
Comment.create(post: fourth_post, author: first_user, text: 'Nice choice' )
Comment.create(post: fourth_post, author: third_user, text: 'Next vacation, i will go there instead' )
Comment.create(post: fourth_post, author: fourth_user, text: 'I love this place' )
Comment.create(post: fourth_post, author: fourth_user, text: 'looks lovely' )

comments = Comment.all
the_first_comment = Comment.first
the_last_comment = Comment.last

cooments_for_post4_by_user4 = Comment.where(post: 'fourth_post', author: 'fourth_user').order(created_at: :desc)
cooments_for_post4_by_user4.each do |comment|
  puts comment.text
end

the_first_comment.update(author: 'fourth_user')

the_last_comment.destroy
