class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  def current_user
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: "Please register or log in!", status: :unauthorized
    end
  end  
  def authenticate_event_host
    @event = Event.find_by(id: params[:id])
    unless current_user.id == @event.user_id
      render json: "Please register or log in!", status: :unauthorized
    end
  end
  def authenticate_item_owner
    @item = Item.find_by(id: params[:id])
    unless current_user.id === @item.user_id
      render json: "Please register or log in!", status: :unauthorized
    end
  end
end


