class LineItem < ActiveRecord::Base
  #描述line_item和order,cart,product表之间关系
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  def total_price
    product.price*quantity
  end
end
