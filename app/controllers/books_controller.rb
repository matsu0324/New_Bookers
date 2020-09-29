class BooksController < ApplicationController
   before_action :authenticate_user!

  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice: 'Your book was successfully created'
    else
      @books = Book.all
      render :index
    end
  end
  def index
  end

  def show
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Your book was successfully destroyed'
  end

  private
  def book_params
    params.require(:@book).permit(:title, :opinion)
  end
end
