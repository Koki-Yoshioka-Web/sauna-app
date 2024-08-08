class ApplicationController < ActionController::Base

    before_action :set_current_user

    def set_current_user
        @current_user= User.find_by(id: session[:user_id])
    end


    def authenticate_user
        if @current_user==nil
            flash[:notice]="ログイン必要です"
            redirect_to("/login")
        end
    end

    def forbid_login_user
    if @current_user
        flash[:notice]="すでにログインしています"
        redirect_to("/posts/index")
    end
end
def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  helper_method :current_user, :user_signed_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to login_path unless user_signed_in?
  end




    
    
end
 