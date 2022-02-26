class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def index
    @users=User.all
    @book=Book.new
  end
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

def edit
  @user=User.find(params[:id])

  if @user == current_user
            render "edit"
          else
            redirect_to user_path(current_user)
          end
end

  def update
    @users=User.new
    @user = User.find(params[:id])
   if @user.update(user_params)
        redirect_to user_path(@user[:id]),notice: "You have updated user successfully."
        else
          render:edit
          #flash[:alert]="error"
          #redirect_to request.referer
          end
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end