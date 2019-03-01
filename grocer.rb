require 'pry'
def consolidate_cart(cart)
  # code here
  consolidated = {}
  cart.each do |item|
    item.map do |product, data|
      item[product][:count] = cart.count(item)
      if !consolidated.has_key?(product)
        consolidated[product] = data
      end
    end
  end
  consolidated
end

def apply_coupons(cart, coupons)
  cart_with_coupons = cart.clone
  cart.each do |product, attributes|
    coupons.each do |coupon_data|
      while product == coupon_data[:item] && cart_with_coupons[product][:count] >= coupon_data[:num]
        if cart_with_coupons.has_key?("#{product} W/COUPON")
          cart_with_coupons["#{product} W/COUPON"][:count] += 1
        else
          cart_with_coupons["#{product} W/COUPON"] = {
            :price => coupon_data[:cost],
            :clearance => cart[product][:clearance],
            :count => 1
          }
        end
        cart_with_coupons[product][:count] -= coupon_data[:num]
      end
    end
  end
  cart_with_coupons
end

def apply_clearance(cart)
  cart.map do |product, attributes|
    if cart[product][:clearance]
      cart[product][:price] *= 0.8
      cart[product][:price] = cart[product][:price].round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolidate_cart(cart)
end
