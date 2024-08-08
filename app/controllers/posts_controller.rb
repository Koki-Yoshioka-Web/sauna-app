class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    translated_survey = post_params[:survey]
    @post = current_user.posts.build(post_params.merge(survey: translated_survey))

    if @post.save
      redirect_to posts_path, notice: 'サウナ仲間を募集しました'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, survey: [:place, :car, :time])
  end
end
