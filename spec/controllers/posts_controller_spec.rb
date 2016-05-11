require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { User.create(email: "poster@social.com", password: "12345678") }

  let(:valid_attributes) do
    {
      message: "I'm writing tests now!",
      user: user
    }
  end

  let(:invalid_attributes) do
    {
      message: ""
    }
  end

  let!(:a_post) { Post.create! valid_attributes }

  describe "GET #index" do
    it "assigns all posts as @posts" do
      get :index
      expect(assigns(:posts)).to eq([a_post])
    end

    context "when logged in" do
      login_user
    end
  end

  describe "GET #show" do
    it "assigns a post as @post" do
      get :show, {id: a_post.id}
      expect(assigns(:post)).to eq(a_post)
    end

    context "when logged in" do
      login_user
    end
  end
end
