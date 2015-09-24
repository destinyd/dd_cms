module DdCms
  class CategoriesController < ApplicationController
    def index
      @categories = Category.root.page params[:page]
    end

    def new
      if params[:category].blank?
        @category = Category.new
      else
        @category = Category.new category_params
      end
      @categories = DdCms::Category.root
    end

    def create
      @category = Category.new category_params
      if @category.save
        redirect_to categories_path
      else
        @categories = DdCms::Category.root
        render :new
      end
    end

    def show
      @category = Category.find params[:id]
    end

    def edit
      @category = Category.find params[:id]
      @categories = DdCms::Category.root
    end

    def update
      @category = Category.find params[:id]
      if @category.update_attributes category_params
        redirect_to categories_path
      else
        @categories = DdCms::Category.root
        render :edit
      end
    end

    def destroy
      @category = Category.find params[:id]
      @category.destroy
      redirect_to categories_path
    end

    def move_up
      @category = Category.find params[:id]
      @category.move_up
      redirect_to categories_path
    end

    def move_down
      @category = Category.find params[:id]
      @category.move_down
      redirect_to categories_path
    end

    private
    def category_params
      params.require(:category).permit(:title, :category_id)
    end
  end
end
