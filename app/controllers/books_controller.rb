class BooksController < ApplicationController
  def index
    @book=Book.new
    @user=User.find(current_user.id)
    @books=Book.all
  end

  def create
    @books=Book.all
    @user=User.find(current_user.id)
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      ##バリデーションで実装
      # flash[:alert]="create failed"
      render :index
    end
  end

  def show
    # @book_create=Book.new
    @book=Book.find(params[:id])
    @user=User.find(@book.user_id)
  end


  def edit
    @book=Book.find(params[:id])
    redirect_to books_path unless @book.user.id==current_user.id
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      ##バリデーションで実装
      render :edit
      
      # @book.errors.full_messages.each_with_index do |messeage,i|
      #   flash[:i]=messeage
      # end
      # redirect_to edit_book_path(@book.id)
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
