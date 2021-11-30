class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    @users = User.all

    authorize @users

    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    authorize @user
    render json: @user, status: :ok
  end

  # REGISTER
  def create
    @user = User.create(user_params)

    authorize @user

    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # PUT /users/{username}
  def update
    authorize @user
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    authorize @user
    @user.destroy
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation, :birthdate)
  end
end
