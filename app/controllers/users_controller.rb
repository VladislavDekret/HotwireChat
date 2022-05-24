class UsersController < ApplicationController
  def show
    @user = User.find_by!(id: params[:id])

    @user_messages = MessageDecorator.decorate_collection(
      Message.includes(:likes)
        .where(user_id: @user.id)
        .where("messages.user_id" == "likes.user_id")
        .where("messages.id" == "likes.message_id")
    )
  end
end
