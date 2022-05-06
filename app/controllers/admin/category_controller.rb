class Admin::CategoryController < ApplicationController
  def index
    @categories = Category.all
    @category_list = @categories.map(&:name)
  end

  def new
    @category = Category.new
  end

  def create
  end
end
