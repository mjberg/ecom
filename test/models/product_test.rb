require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:derscription].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?
end
