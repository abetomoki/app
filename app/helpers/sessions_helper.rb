module SessionsHelper
    #ログインしている場合にtrueを、ログインしていない場合にはnilを返す。
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    #@current_userが存在していればtrueを、ログインしていない場合はnilを返す。
    def logged_in?
        !!current_user
    end
    
    #
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
end

