require 'pry'
def consolidate_cart(cart)
  # code here
  consolodated = {}
  cart.each do |item|
    item.map do |product, data|
      item[product][:count] = cart.count(item)
      if !consolodated.has_key?(product)
        consolodated[product] = data
      end
    end
  end
  consolodated
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
  # code here
  consolodate_cart(cart)
  binding.pry
end
