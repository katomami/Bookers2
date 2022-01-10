  class BooksController < ApplicationController
    before_action :correct_user, only:[:edit,:update]

          def index
            @user=current_user
            @books=Book.all
            @book=Book.new
          end

          def show
            @book=Book.find(params[:id])

            @user=User.find(@book.user_id)
            @new_book=Book.new
          end

          def edit
            @book=Book.find(params[:id])





          end

          def update
            @book=Book.find(params[:id])
            if @book.update(book_params)
            flash[:notice]="you have updated book successfully."
             redirect_to book_path(@book.id)
            else
            render :edit
            end
          end

          def destroy
            @book=Book.find(params[:id])
            @book.destroy
            redirect_to books_path
          end



          def create

            @book=Book.new(book_params)
            @book.user_id=current_user.id
            if @book.save
              flash[:notice]="You have created book successfully."
             redirect_to book_path(@book)
            else
            @user=current_user
            @books=Book.all
            render :index
            end
          end

          private

          def book_params
            params.require(:book).permit(:title,:body)
          end

          def correct_user
            user=Book.find(params[:id]).user
            if current_user.id!=user.id
              redirect_to books_path
            end
          end



  end