module DdCms
  class PagesController < ApplicationController
    def index
      @pages = Page.recent.page params[:page]
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new page_params
      if @page.save
        redirect_to pages_path
      else
        render :new
      end
    end

    def show
      @page = Page.find params[:id]
    end

    def edit
      @page = Page.find params[:id]
    end

    def update
      @page = Page.find params[:id]
      if @page.update_attributes page_params
        redirect_to pages_path
      else
        render :edit
      end
    end

    def destroy
      @page = Page.find params[:id]
      @page.destroy
      redirect_to pages_path
    end

    private
    def page_params
      params.require(:page).permit(:title, :slug, :content_body)
    end
  end
end

