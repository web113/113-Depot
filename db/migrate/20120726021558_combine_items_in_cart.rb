class CombineItemsInCart < ActiveRecord::Migration
  def self.up
    #同一个商品在购物车里面只显示一次
    Cart.all.each do |cart|
      #在购物车里统计每种商品的数量
      sums = cart.line_items.group(:product_id).sum(:quantity)
      
      sums.each do |product_id, quantity|
        if quantity > 1
          #把单独的商品条目移除掉
          cart.line_items.where(:product_id => product_id).delete_all
          #用统一的商品条目来代替
          cart.line_items.create(:product_id => product_id, :quantity => quantity)
        end
      end
    end
  end
  def self.down
    #把数量大于等于1的商品划分成多个条目
    LineItem.where("quantity>1").each do |lineitem|
      #添加单独的商品条目
      lineitem.quantity.times do
        LineItem.create :cart_id =>lineitem.cart_id,
          :product_id => lineitem.product_id, :quantity =>1
      end
      
      #把原来的商品条目移除掉
      lineitem.destroy
    end
  end
end
