class BooksController < ApplicationController
  def index
    @book=Book.new
    @user=User.find(current_user.id)
    @books=Book.all
  end

  def create
    book=Book.new(book_params)
    book.user_id=current_user.id
    book.save
    redirect_to books_path
  end

  def show
    @book_create=Book.new
    @book=Book.find(params[:id])
    @user=User.find(@book.user_id)
  end


  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:opinion)
  end

end
