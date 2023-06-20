require 'rails_helper'

describe 'user/index', type: :feature do
  before(:all) do
    @user1 = User.create(name: 'Jane', photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=
    M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80', bio: 'Love to see the world')
    @user2 = User.create(name: 'Anna', photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=
    M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80', bio: 'Street art lover')
  end

  it 'shows all users' do
    visit users_path
    expect(page).to have_content('Jane')
    expect(page).to have_content('Anna')
  end

  it 'shows the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=
    M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80']")

    expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=
    M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80']")
  end

  it 'see the number of posts each user has written' do
    visit users_path

    expect(page).to have_content('Number of posts: 0')
  end

  it 'see the number of posts each user has written' do
    @post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post')

    visit users_path

    expect(page).to have_content('Number of posts: 1')
  end

  it 'should redirect to that user\'s show page on clicking a user' do

    @user3 = User.create(name: 'kate', photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=
    M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80', bio: 'Street art lover')

    visit users_path

    within ".users" do
      click_link(@user3.name)
    end

    expect(current_path).to eq(user_path(@user3))
  end
end

describe 'user/show', type: :feature do
  before(:all) do
    @user1 = User.create(name: 'Tim', photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=
    M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80', bio: 'Love to see the world')

    @post1 = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post')
    @post2 = Post.create(author_id: @user1.id, title: 'Adventure', text: 'Checkout this waterfall')
    @post3 = Post.create(author_id: @user1.id, title: 'Movie date', text: 'This is how movie night should be like!')
    @post4 = Post.create(author_id: @user1.id, title: 'Wind', text: 'Silent breeze')
  end

  it 'shows the profile picture, number of posts and bio for each user' do
    visit user_path(@user1)

    expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=
    M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80']")

    expect(page).to have_content('Tim')

    expect(page).to have_content('Number of posts: 4')

    expect(page).to have_content('Love to see the world')
  end

  it 'should show the user`s recent 3 posts.' do
    visit user_path(@user1)

    expect(page).to_not have_content('Hello')
    expect(page).to have_content('Adventure')
    expect(page).to have_content('Movie date')
    expect(page).to have_content('Wind')
    expect(page).to have_content('See all Posts')
  end

  it 'should redirect to a specific post on click' do
    visit user_path(@user1)
  
    post_link = find('a', text: 'Adventure')
    post_link.click
    expect(page).to have_current_path(user_post_path(@user1, @post2))
  end
 
  it 'should redirect to all posts on click' do
    visit user_path(@user1)
  
    post_link = find('a', text: 'See all Posts')
    post_link.click
    expect(page).to have_current_path(user_posts_path(@user1))
  end
end
