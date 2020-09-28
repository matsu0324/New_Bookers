class BooksController < ApplicationController
   before_action :authenticate_user!
  def new
  end

  def index
  end
  def create
    @book = book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice: 'Your book was successfully created'
    else
      @books = Book.all
      render :index
    end
  end


  def show
  end
end
