class ApplicationController < ActionController::API
    before_action :authorized

    def secret_key
        "my_s3cr3t"
    end

    def encode_token(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, secret_key, true, 
                algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def login 
       user = User.find_by(username: params[:username])

       if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode(payload)
            render :json => {user: user, token: token}
       else
            render json: {error: "User not found"}
       end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def token_authenticate 
        token = request.headers["Authenticate"]
        user=User.find(decode(token)["user_id"])

        render json: user
    end

    def logged_in? 
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end