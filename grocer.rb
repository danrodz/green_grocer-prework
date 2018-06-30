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
  cart.each do |product, values|
    if values[:clearance]
      discounted_price = (values[:price] * 0.80).round(2)
      values[:price] = discounted_price
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
end
