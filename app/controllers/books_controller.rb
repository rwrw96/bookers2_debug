class BooksController < ApplicationController
    before_action :ensure_correct_user, only: [:update,:edit]


  def show
<<<<<<< HEAD
     @book = Book.find(params[:id])
     @new_book = Book.new
     @favorite_count =  Favorite.where(book_id: params[:book_id], user_id: current_user.id).count
<<<<<<< HEAD
     @book_comment = current_user.book_comments.build
=======
     @book_comment = BookComment.new
     @book_comments = @book.book_comments
     @book_comment_count = @book.book_comments.count
     @user = @book.user
>>>>>>> d257a19ad988372e00287868aea23a6cef081a3c
=======
   @book = Book.find(params[:id])
   @new_book = Book.new
>>>>>>> 615d3845988e9fc6489452fc9f6c8a540d51dd97
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      flash[:notice] = @book.errors.full_messages
      render 'index'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)    
  end
  
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end
end
