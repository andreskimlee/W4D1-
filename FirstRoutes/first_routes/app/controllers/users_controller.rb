class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!" 
    users = User.all
    render json: users
  end
  
  def create 
    user = User.new(user_params)
    if user.save 
      render json: user 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity 
    end
  end 

  def show
    user = User.find(params[:id])
    render json: user
  end 

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
      # redirect_to users_new_url 
    else
      render json: user.errors.full_messages, status: 417
    end
  end

  def destroy
    user = User.find_by(id: params[:id]) #find by does not return error, column needs to be included / find searches by id and returns null if not found 
    if user
      user.destroy
      redirect_to users_url #
    else
      render json: 'User not found', status: 404
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end 
end