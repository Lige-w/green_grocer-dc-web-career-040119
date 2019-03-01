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
      binding.pry
    end
  end
end

def apply_coupons(cart, coupons)

end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
