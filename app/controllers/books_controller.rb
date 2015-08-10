class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def new
		@book  = Book.new
	end

	def create
		# render plain: params[:book]
		@book  = Book.new(book_params)
		if @book.save
			redirect_to books_path
		else
			render 'new'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to books_path
		else 
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
			redirect_to books_path
		end		
	end

	private 
	def book_params
		params.require(:book).permit(:name, :detail, :writer)
	end
end
