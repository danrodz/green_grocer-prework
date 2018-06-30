def consolidate_cart(cart)
  cart.each_with_object({}) do |products, product_hash|
    products.each do |product, keys|
      if product_hash[product]
        keys[:count] += 1
      else
        keys[:count] = 1
        product_hash[product] = keys
      end
    end
  end
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    product = coupon[:item]
    if cart[product] && cart[product][:count] >= coupon[:num]
      if cart["#{product} W/COUPON"]
        cart["#{product} W/COUPON"][:count] += 1
      else
        price = coupon[:cost]
        clearance = cart[product][:clearance]
        cart["#{product} W/COUPON"] = {
          count: 1,
          price: price
        }
        cart["#{product} W/COUPON"][:clearance] = clearance
      end
      cart[name][:count] -= coupon[:num]
    end
  cart
end

# def apply_coupons(cart, coupons)
#   coupons.each do |coupon|
#     name = coupon[:item]
#     if cart[name] && cart[name][:count] >= coupon[:num]
#       if cart["#{name} W/COUPON"]
#         cart["#{name} W/COUPON"][:count] += 1
#       else
#         cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
#         cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
#       end
#       cart[name][:count] -= coupon[:num]
#     end
#   end
#   cart
# end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
