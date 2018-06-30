def consolidate_cart(cart)
  # code here
  cart.each_with_object({}) do |products, product_hash|
    products.each do |product, attributes|
      if product_hash[product]
        attributes[:count] += 1
      else
        attributes[]
      end
    end
  end
end

def apply_coupons(cart, coupons)
  products_with_coupons = {}
  coupons.each do |coupon_hash|
    cart.each do |product, product_hash|
      if product == product_hash[:item] && product_hash[:count] >= coupon_hash[:num]
        product_hash[:count] = product_hash[:count] - coupon_hash[:num]
        new_product = coupon_hash[:item] + " w/coupon"
        products_with_coupons[new_product] = {
          price: coupon_hash[:cost],
          count: 1,
          clearance: product_hash[:clearance]
        }
      end
    end
  end
  cart.merge(products_with_coupons)
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end
      cart[name][:count] -= coupon[:num]
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
