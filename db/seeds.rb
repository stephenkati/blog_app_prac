tom_photo = 'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=
M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'

lilly_photo = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=
M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'

john_photo = 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=
M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'

sophie_photo = 'https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-4.0.3&ixid=
M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80'

first_user = User.create(name: 'Tom', photo: tom_photo, bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: lilly_photo, bio: 'Teacher from Poland.')
third_user = User.create(name: 'John', photo: john_photo, bio: 'Engineer from the United States.')
fourth_user = User.create(name: 'Sophie', photo: sophie_photo, bio: 'Artist from France.')

first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post.')
second_post = Post.create(author_id: second_user.id, title: 'Greetings', text: 'This is my first post as well.')

third_post = Post.create(author_id: first_user.id, title: 'Updates', text: 'Just sharing some updates.')
fourth_post = Post.create(author_id: second_user.id, title: 'Thoughts', text: 'Sharing my thoughts on a recent topic.')

fifth_post = Post.create(author_id: first_user.id, title: 'New project', text: 'Excited to announce my new project.')
sixth_post = Post.create(author_id: second_user.id, title: 'Travel memories', text: 'Reminiscing about my favorite travel moments.')

seventh_post = Post.create(author_id: first_user.id, title: 'Book recommendation', text: 'Highly recommend this new book.')
eighth_post = Post.create(author_id: second_user.id, title: 'Inspiration', text: 'Sharing some motivational quotes.')

first_comment = Comment.create(post_id: first_post.id, author_id: third_user.id, text: 'Hey there, how`s it going?')
second_comment = Comment.create(post_id: first_post.id, author_id: fourth_user.id, text: 'Nice to see you around!')
third_comment = Comment.create(post_id: eighth_post.id, author_id: first_user.id, text: 'Great shot, Lisa!')
fourth_comment = Comment.create(post_id: eighth_post.id, author_id: third_user.id, text: 'I love your photography skills!')
fifth_comment = Comment.create(post_id: eighth_post.id, author_id: second_user.id, text: 'This is so inspiring!')
six_comment = Comment.create(post_id: fourth_post.id, author_id: third_user.id, text: 'Congratulations on your achievement!')
seventh_comment = Comment.create(post_id: eighth_post.id, author_id: fourth_user.id, text: 'You always have the best ideas!')
eighth_comment = Comment.create(post_id: sixth_post.id, author_id: first_user.id, text: 'I can`t wait to try this recipe!')

first_like = Like.create(post_id: first_post.id, author_id: third_user.id)
second_like = Like.create(post_id: first_post.id, author_id: fourth_user.id)
third_like = Like.create(post_id: eighth_post.id, author_id: first_user.id)
fourth_like = Like.create(post_id: eighth_post.id, author_id: third_user.id)
fifth_like = Like.create(post_id: eighth_post.id, author_id: second_user.id)
six_like = Like.create(post_id: fourth_post.id, author_id: third_user.id)
seventh_like = Like.create(post_id: eighth_post.id, author_id: fourth_user.id)
