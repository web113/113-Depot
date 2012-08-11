class SubcategoriesController < ApplicationController
  skip_before_filter :authorize

  # GET /subcategories
  # GET /subcategories.xml
  def index
    @subcategories = Subcategory.all
    @subcate= params[:subcate]
    @results = Product.subcate(params[:subcate]) 
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subcategories }
    end
    
  end

  # GET /subcategories/1
  # GET /subcategories/1.xml
  def show
    @subcategory = Subcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subcategory }
    end
  end

  # GET /subcategories/new
  # GET /subcategories/new.xml
  def new
    @subcategory = Subcategory.new
    @subcate_one =params[:subcate_one]
    @result = Product.subcate(params[:subcate_one])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subcategory }
    end
  end

  # GET /subcategories/1/edit
  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  # POST /subcategories
  # POST /subcategories.xml
  def create
    @subcategory = Subcategory.new(params[:subcategory])

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to(@subcategory, :notice => 'Subcategory was successfully created.') }
        format.xml  { render :xml => @subcategory, :status => :created, :location => @subcategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subcategories/1
  # PUT /subcategories/1.xml
  def update
    @subcategory = Subcategory.find(params[:id])

    respond_to do |format|
      if @subcategory.update_attributes(params[:subcategory])
        format.html { redirect_to(@subcategory, :notice => 'Subcategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.xml
  #def destroy
  #  @subcategory = Subcategory.find(params[:id])
  #  @subcategory.destroy

  #  respond_to do |format|
  #    format.html { redirect_to(subcategories_url) }
  #    format.xml  { head :ok }
  #  end
  #end
end
