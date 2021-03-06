class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :comments

  CATE_TYPES = ["Literature", "Management", "Culture","Life", "Technology"]

  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors[:base] << "Line Items present"
      return false
    end
  end
  
  #-------------search-------------------------
  def self.search(query)
    if query 
      #q_item = query.split(" ")
      #find(:all, :conditions => ["title LIKE ?", "%#{query}%"])
      #find(:all, :conditions => ['title like :title',:title=>"%#{query}%"])  
      #for item in q_item
         find(:all, :conditions => ['title like ? OR cate like ?',"%#{query}%", "%#{query}%"])
      #end
    else
      find(:all)
    end
  end
  #-------------subcate-------------------------
  def self.subcate(query)
    if query 
      find(:all, :conditions => ['cate LIKE ?', "%#{query}%"])
      #find(:all, :conditions => {:cate => query})
    else
      find(:all)
    end
  end
  
  validates :title, :description, :category, :cate, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with    => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
