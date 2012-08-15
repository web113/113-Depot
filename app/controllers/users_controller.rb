class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  skip_before_filter :isAdmin, :only => [:new, :create, :edit, :update]
  before_filter :canModify, :only => [:edit, :update]

  # GET /users
  # GET /users.xml
  def index
    @users = User.order(:name).paginate :page =>params[:page],:per_page => 10
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @cart = current_cart

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @cart = current_cart
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @cart = current_cart

    respond_to do |format|
      if @user.save
        Cart.create(:user_id => @user.id)
        if session[:user_id] && User.find_by_id(session[:user_id]).name == "admin"
          format.html { redirect_to(users_url, :alert => "User #{@user.name} was successfully created.") }
        else
          format.html { redirect_to(login_url, :alert => "User #{@user.name} was successfully created.") }
        end
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        if User.find_by_id(session[:user_id]).name == "admin"
          format.html { redirect_to(users_url, :alert => "User #{@user.name} was successfully updated.") }
        else
          format.html { redirect_to(admin_url, :alert => "User #{@user.name} was successfully updated.") }
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])

    begin
      @user.destroy
      flash[:alert] = "User #{@user.name} deleted"
    rescue Exception => e
      flash[:alert] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def canModify
    unless User.find_by_id(session[:user_id]).name == "admin" || session[:user_id] == params[:id].to_i
      redirect_to permission_url
    end
  end
end
