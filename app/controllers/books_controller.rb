class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(params.require(:book).permit(:name,:price,:author_id))
    if @book.valid?
      flash[:notice] = "successfully Created Book"
      redirect_to books_path
    
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to new_book_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:name,:price,:author_id))
      flash[:notice] = "Successfully Updated Book!"
      redirect_to book_path(@book)
    
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to edit_book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Successfully Deleted Book!"
      redirect_to books_path
    else
    flash[:errors] = @book.errors.full_messages
    redirect_to new_book_path
    end
  end
end
