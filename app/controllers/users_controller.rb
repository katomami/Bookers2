class UsersController < ApplicationController
  



  def show
    
    
    
    
    @user=User.find(params[:id])
    @books=@user.books
  

  end

  def new
    @user=User.new
  end

  def index
    @users=User.all
    @book=Book.new
    @user=current_user


  end

  def edit
    
    @user=User.find(params[:id])
   if @user!=current_user
    redirect_to user_path(current_user)
   end
  end
    
      
  
    

  

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end

  end

  def create
    @book=Book.create(book_params)
    @book.user_id=current_user.id
    if @book.save
    redirect_to books_path(@book.id), notice: 'You have created book successfully.'
    else
    @books=Book.all
    render :index
    end
  end

  private

  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
  

end
