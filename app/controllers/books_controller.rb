class BooksController < ApplicationController
  layout 'admin'

   before_action :find_student ,:only=>[:new,:create,:edit,:update]
   before_action :logged_in_restriction ,:excpet=>[:login,:attempt_login,:logout]
  def index
  @books=Book.ascending
  end


 def show
  @book=Book.find(params[:id])
  end

 
  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      flash[:notice]="book saved successfully!!!"
      redirect_to(books_path)
    else
      render('new')
  end
end

  def edit
      @book=Book.find(params[:id])
     
  end

  def update
     @book=Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice]="book updates successfully!!!"
        redirect_to(book_path(@book))
      else
        render('edit')
      end
  end

  def delete
    @book=Book.find(params[:id])
     flash[:alert] = "Are you sure ,you want to delete ."
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "book destroyed successfully."
    redirect_to(books_path)
  end


  private
  def book_params
    params.require(:book).permit(:student_id,:book_name,:author_name,:price,:sold,:author_type)
  end

  def find_student
   @student=Student.ascending
  end
end
