class UsersController < ApplicationController
  
  before_filter :authenticate, :except => [:new, :create]
  before_filter :correct_user, :except => [:index, :new, :create]
  before_filter :admin_user,   :only => :index

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end
 
  def show
    @user = User.find(params[:id])
    @title = @user.fullname
    @accounts = @user.accounts.paginate(:page => params[:page])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
    def admin_user
      current_user.admin?
    end
    
    def correct_user
      @user = User.find(params[:id])
      deny_access unless (current_user?(@user) || current_user.admin?)
    end
    
end
