class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
    redirect_to home_path
    else
    render index
    end
  end


  def edit
    @books = Book.find(params[:id])
    @books.save
    redirect_to books_path
  end

  private
  def book_params
    params.require(:books).permit(:title, :body)
  end

end
