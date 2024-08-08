class LikesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.build(user: current_user)
  
      if @like.save
        redirect_to posts_path, notice: '有意義な整いを...'
      else
        redirect_to posts_path, alert: 'いいねできませんでした。'
      end
    end
  
    def destroy
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
  
      if @like.destroy
        redirect_to posts_path, notice: '整いをキャンセルしました。'
      else
        redirect_to posts_path, alert: 'いいねを取り消せませんでした。'
      end
    end
  
    private
  
    def authenticate_user!
      redirect_to login_path, alert: 'ログインしてください' unless current_user
    end


    def index
        @likes = Like.includes(:user, :post).order(created_at: :desc)
      end
  end
  