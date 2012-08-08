class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
 
  #高级的add_product方法，检查购物车商品列表中是否已经含有该商品，如果有则增加其数量，如果没有则添加进去 
  def add_product(product_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id => product_id)
      line_items << current_item
    end
    current_item
  end
  
  def total_price
    line_items.to_a.sum{ |item| item.total_price}
  end
  
  #def add_quantity(item_id)
  #  current_item = line_items.where(:id => item_id)
  #  current_item.quantity += 1
  #end
  
  #def total_items
  #  line_items.sum(:quantity)
  #end
end
