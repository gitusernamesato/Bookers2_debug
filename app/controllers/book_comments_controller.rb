class BookCommentsController < ApplicationController
  
 def create
   book = Book.find(params[:book_id])
   comment = current_user.book_coments.new(book_coment_params)
   comment.save
   redirect_to book_path(book)
 end
 
 def destroy
   BookComment.find(params[:id]).destroy
   redirect_to book_path(params[:book_id])
 end
 
 private
 
 def book_comment_params
   params.require(:book_comment).permit(:comment)
 end 
end
