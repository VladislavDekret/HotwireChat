class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @user_messages = MessageDecorator.decorate_collection(
      Message.includes(:likes)
        .where(user_id: @user.id)
        .where('messages.user_id' == 'likes.user_id')
        .where('messages.id' == 'likes.message_id')
    )
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_permited_params)

    redirect_to user_path(@user)
  end

  def user_permited_params
    params.require(:user).permit(:name, :surname, :phone_number, :about)
  end
end
