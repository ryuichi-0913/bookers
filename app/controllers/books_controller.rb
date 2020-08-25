class BooksController < ApplicationController

  def top
  end

  def create
  	@list = Book.new(list_params)
    @list.user_id = current_user.id
   if @list.save
 	# flash[:notice] = 'successfully create'
  	redirect_to book_path(@list), notice: 'successfully create'
   else
   	@lists = Book.all
       render action: :index
   end
  end

  def index
  	@lists = Book.all
    @list = Book.new
  end

  def show
  	@list = Book.find(params[:id])
  end

  def edit
  	@list = Book.find(params[:id])
  end

  def update
  	@list = Book.find(params[:id])
   if @list.update(list_params)
  	redirect_to book_path(@list.id), notice: 'successfully update'
   else
   	render action: :edit
   end
  end

  def destroy
  	list = Book.find(params[:id])
  	list.destroy
  	redirect_to books_path

  end


  private
  def list_params
  	params.require(:book).permit(:title, :body)
  end
end
