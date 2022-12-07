class UsersController < ApplicationController
  def index
    users = User.order(created_at: :desc)
    render_success(:ok, users, meta: { message: "Users loaded." })
  end

  def create
    user = User.new(user_params)

    if user.save
      render_success(:created, user, meta: { message: "User created." })
    else
      render_error(422, user.errors, message: "Failed to create user.")
    end
  end

  def update
    user = User.find(_id: params[:id])

    if user.update(user_params)
      render_success(:created, user, meta: { message: "User updated." })
    else
      render_error(422, user.errors, message: "Failed to update user.")
    end
  end

  def destroy
    user = User.find(_id: params[:id])

    if user.destroy
      render_success(:created, user, meta: { message: "User deleted." })
    else
      render_error(422, user.errors, message: "Failed to delete user.")
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end
end
