class BookCommentsController < ApplicationController
  def create

  end

  def destroy
    @book_comment = Book_comment.where(book_id: params[:book_id], user_id: current_user.id)
    @book_comment.destroy
    redirect_to book_path(book_comment.book)
  end
  
  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
