class BooksController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'Your book was successfully created'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'Your book was successfully updated'
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path, notice: 'Your book was successfully destroyed'
    else
    render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
    redirect_to books_path
    end
  end
end
