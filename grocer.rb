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
        cart["#{product} W/COUPON"] = {
          count: 1,
          price: coupon[:cost]
        }
        cart["#{product} W/COUPON"][:clearance] = cart[product][:clearance]
      end
      cart[product][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
