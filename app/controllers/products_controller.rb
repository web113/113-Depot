class ProductsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :isAdmin, :only => [:index, :show]

  # GET /products
  # GET /products.xml
  def index
    @products = Product.paginate :page =>params[:page],:per_page => 5
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @cart = current_cart

    @comments = Comment.where(:product_id => @product.id)
    @comment = Comment.new

    @allcates = @product.cate.split(";")    

    if session[:user_id]
      @name= User.find_by_id(session[:user_id]).name
    else
      @name=nil
    end

    @average = 0.00
    sum = 0.00   
    if @comments.size != 0
        for com in @comments
           sum += com.score          
        end
        @average = sum / @comments.size
        @average = format("%.2f", @average)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    @cart = current_cart

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @cart = current_cart
  end

  # POST /products
  # POST /products.xml
  def create
    if params[:product][:image_url].nil?
      filename = "book.jpg"
    else
      filename = uploadFile(params[:product][:image_url])
    end
    @product = Product.new(
      :title => params[:product][:title], 
      :description => params[:product][:description], 
      :image_url => "/images/#{filename}", 
      :price => params[:product][:price], 
      :category => params[:product][:category], 
      :cate => params[:product][:cate]
    )
    @cart = current_cart

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom   #Rails将会寻找名为who_bought.atom.builder的template(app/views/products/who_bought.atom.builder):
      format.xml {render :xml => @product}
    end
  end
  
  def uploadFile(file)
    if !file.original_filename.empty?
      @filename = getFileName(file.original_filename)
      if @filename =~ /\.(gif|jpg|png)$/
        File.open("#{RAILS_ROOT}/public/images/#{@filename}", "wb") do |f|
          f.write(file.read)
        end
      end
      return @filename
    end
  end

  def getFileName(filename)
    if !filename.nil?
      Time.now.strftime("%Y_%m_%d_%H_%M_%S") + '_' + filename
    end
  end
end
