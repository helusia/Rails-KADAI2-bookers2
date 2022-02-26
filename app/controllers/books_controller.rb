class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top]

def destroy
  @book=Book.find(params[:id])
  @book.destroy
  #削除したら一覧ページへ
  redirect_to books_path

end

def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render:edit
    #flash[:alert]="error"
    #redirect_to request.referer
    end

  end

def edit

    @book=Book.find(params[:id])

    if @book.user == current_user
            render "edit"
          else
            redirect_to books_path
          end
end

def show

  @book=Book.find(params[:id])
  @books=Book.new
  @user=@book.user

end

  def index
    @book=Book.new
    @books=Book.all
    @user=current_user
    #@books=@user.books


  end
   # 投稿データの保存
  def create
    @books=Book.all
    @user=current_user
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render:index
      #flash[:alert]="error"
       #redirect_to request.referer
    end
  end

  #投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :caption)
  end

end