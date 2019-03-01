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
  cart.map do |product, attributes|
    binding.pry
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
