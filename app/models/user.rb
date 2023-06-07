class User < ApplicationRecord
  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "author_id"
  has_many :likes, foreign_key: "author_id"

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from USA.')
fourth_user = User.create(name: 'Mike', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Germany.')

users = User.all
the_first_user = User.first
the_last_user = User.last
lilly = User.find_by(name: 'Liily')

jane = User.find_by(name: 'John')
jane.update(name: 'Jane')

User.update(:all, photo: 'https://unsplash.com/photos/mgAioVzKcjQ')

tom = User.find_by(name: 'Tom')
tom.destroy
