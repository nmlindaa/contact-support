module AuthConcern
  extend ActiveSupport::Concern

  def authenticate_user! (dest=new_user_session_path)
    redirect_to dest if !current_user
  end
end
