class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @post = @category.relationship_categories
    @subject = @category.subject_post
  end
end
