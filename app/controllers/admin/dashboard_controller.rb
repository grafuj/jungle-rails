class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    puts "executing admin dashboard controller show"
    @category_count = Category.count
    @product_count = Product.count
    puts "here is the @category_count", @category_count
  end
end
