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

  describe "GET #new" do
    it "assigns a new post as @post and renders the new template" do

      get :new

      expect(assigns(:post)).to be_a_new(Post)
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    before do
      get :edit, {id: a_post.id}
    end

    it "assigns a requested post as @post" do
      expect(assigns(:post)).to eq(a_post)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

end
