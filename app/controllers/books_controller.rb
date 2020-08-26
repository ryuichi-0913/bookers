class BooksController < ApplicationController



  def top
  end

  def create
  	@book = Book.new(book_params)
    @book.user = current_user
   if @book.save
 	# flash[:notice] = 'successfully create'
  	redirect_to book_path(@book), notice: 'successfully create book'
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
  	redirect_to book_path(@book.id), notice: 'successfully update'
   else
   	render action: :edit
   end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path

  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
