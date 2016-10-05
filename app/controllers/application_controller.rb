class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :is_admin?

  def current_user
    @current_user ||= Gtf::User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to login_path unless current_user
  end

  def is_admin?
    current_user && current_user.permission_group_id == 1
  end


  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.page(params[:page] ||= 1))
  end

end
