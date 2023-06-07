class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, :likes

  after_save :update_posts_number

  def latest_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private
  def update_posts_number
    author.increment!(:posts_counter)
  end
end

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'Journey', text: 'This is mjust the beginning!')
third_post = Post.create(author: third_user, title: 'Fun, laughter', text: 'When was the last time you had a good laugh?')
fourth_post = Post.create(author: fourth_user, title: 'Experience nature', text: 'Love this place:)')
fifth_post = Post.create(author: fourth_user, title: 'Echoes of Eternity', text: 'Hidden secrets.')
sixth_post = Post.create(author: fourth_user, title: 'Whispers in the Wind', text: 'Soft breeze.')
seventh_post = Post.create(author: fourth_user, title: 'The Journey of Shadows', text: 'Infinite depths.')
eighth_post = Post.create(author: fourth_user, title: 'Lost in the Abyss', text: 'Unseen dangers.')

posts = Post.all
the_first_post = Post.first
the_last_post = Post.last

funny = Post.find_by(title: 'Fun, laughter')
funny.update(title: 'Fun, laughter, joy')

the_first_post.destroy
