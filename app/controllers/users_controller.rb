class UsersController < ApplicationController
  def index
    @user=User.find(current_user.id)
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user.id==current_user.id
  end

  def update
    @user=User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
      ##バリデーションで実装
      # flash[:alert]="failed update"
      
      #   @user.errors.full_messages.each_with_index do |messeage,i|
      #     flash[:i]=messeage
      #   end
      #   redirect_to edit_user_path(@user.id)
    end

  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
