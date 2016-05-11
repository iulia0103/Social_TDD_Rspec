require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user) { User.create(email: "user@social.com", password: "12345678") }
  let(:other_user) { User.create(email: "other-user@social.com", password: "12345678") }

  before(:each) do
    assign(:posts, [
      Post.create!(
        message: "Hello, I'm writing tests!",
        user: user
      ),
      Post.create!(
        message: "Hi, Here's another post!",
        user: other_user
      )
    ])

    assign(:post, Post.new)

    render
  end

  it "renders a list of posts" do
    assert_select ".post>h1", text: "Hey You", count: 1
    assert_select ".post>h1", text: "Hey You too", count: 1
  end

  it "shows the user's email with the post" do
    assert_select ".post>.meta", text: user.email, count: 1
    assert_select ".post>.meta", text: other_user.email, count: 1
  end

end
