class AccountsController < ApplicationController
  before_filter :authenticate
  before_filter :okay_user

  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = Account.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])
    @user = User.find(@account.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new
    
    if current_user.admin? 
      @user_choices = User.all
    else
      @user_choices = [current_user]
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end

  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    
    if current_user.admin? 
      @user_choices = User.all
    else
      @user_choices = [current_user]
    end
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to(@account, :notice => 'Account was successfully created.') }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(@account, :notice => 'Account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def deposit
    @account = Account.find(params[:id])

    respond_to do |format|
      if (amount = params[:dep_amount])
        amount = amount.to_f
        @account.deposit(amount)
        format.html { redirect_to(@account, :notice => "Account #{@account.id} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "deposit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def withdrawal
    @account = Account.find(params[:id])

    respond_to do |format|
      if (amount = params[:withd_amount])
        amount = amount.to_f
        if (amount <= @account.amount)
           @account.withdraw(amount)
           format.html { redirect_to(@account, :notice => "Account #{@account.id} was successfully updated.") }
           format.xml  { head :ok }
        else
           @error = "Amount may not exceed the account balance."
           format.html { render :action => "withdrawal" }
           format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "withdrawal" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private

    def authenticate
      deny_access unless signed_in?
    end
    
    def okay_user
      if current_user.admin?
      else 
        @user = User.find(Account.find(params[:id]).user_id)
        redirect_to(root_path) unless current_user?(@user)
      end
    end
    
    def correct_user
      @user = User.find(Account.find(params[:id]).user_id)
      redirect_to(root_path) unless current_user?(@user)
    end
    
end
