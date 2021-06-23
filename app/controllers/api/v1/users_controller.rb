class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, show]
    has_many :campaigns, -> { order(title: :asc)}

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        @users = User.all 
    end

    def show
        @user = User.find(user_params[:id])
    end

    def create
        @user = User.create(user_params)
        
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'Nat 1! Critical Failure'}, status: :not_acceptable
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
