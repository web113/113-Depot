class OrdersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  skip_before_filter :isAdmin
  before_filter :isShipped, :only => [:edit, :destroy]
  before_filter :isOwner, :only => [:show, :edit, :destroy]

  # GET /orders
  # GET /orders.xml
  def index
    if User.find_by_id(session[:user_id]).name != "admin"
      @orders = User.find_by_id(session[:user_id]).orders
      @orders = @orders.paginate :page => params[:page], :order => 'created_at desc',
        :per_page => 3

      #@line_items = LineItem.where(:order_id => @order.id)
      @users = User.all
      @lineitems = LineItem.all
      @products = Product.all
      
    else
      @orders = Order.paginate :page => params[:page], :order => 'created_at desc',
        :per_page => 3
      @lineitems = LineItem.all
      @products = Product.all
      @users = User.all
    end
    #@orders = Order.all
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])
    #@line_items = LineItem.where(:order_id => @order.id)
    @line_items = LineItem.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @cart = current_cart
    if current_cart.line_items.empty?
      redirect_to store_url, :notice => "Your cart is empty"
      return
    end
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @cart = current_cart
    @id = params[:id]
  end

  # POST /orders
  # POST /orders.xml
  def create
    data = params[:order]
    data[:user_id] = session[:user_id]
    @cart = current_cart

    unless @cart.line_items.empty?
      @order = Order.new(data)
      @order.add_line_items_from_cart(current_cart)

      respond_to do |format|
        if @order.save
          user = User.find_by_id(session[:user_id])
          for line_item in user.cart.line_items
            LineItem.destroy(line_item)
          end
          Notifier.order_received(@order).deliver

          @line_items = LineItem.all
          @products = Product.all
          for lineitem in @line_items 
            if lineitem.order_id == @order.id
              for product in @products
                if  product.id == lineitem.product_id
                  product.inventory = product.inventory - lineitem.quantity                     
                  product.save
                end
              end
            end    
          end

          format.html { redirect_to(store_url, :notice => I18n.t('.thanks')) }
          format.xml  { render :xml => @order, :status => :created, :location => @order }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to(store_url, :notice => "Oooops, your cart is empty!")}
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(orders_url, :alert => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @line_items = LineItem.all
          @products = Product.all
          for lineitem in @line_items 
            if lineitem.order_id == @order.id
              for product in @products
                if  product.id == lineitem.product_id
                  product.inventory = product.inventory - lineitem.quantity                     
                  product.save
                end
              end
            end    
          end
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  def ship
    @order = Order.find(params[:id])
    @order.shipped = 1
    @order.save
    Notifier.order_shipped(@order).deliver

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { render :xml => @order }
    end
  end

  protected
    def isShipped
      unless params[:id] && Order.find(params[:id]).shipped == 0
        redirect_to permission_url
      end
    end

  protected
    def isOwner
      unless User.find_by_id(session[:user_id]).name == "admin" || session[:user_id] == Order.find(params[:id]).user.id
        redirect_to permission_url
      end
    end
end
