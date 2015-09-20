module DdCms
  class NavsController < ApplicationController
    def index
      @navs = Nav.root.page params[:page]
    end

    def new
      if params[:nav].blank?
        @nav = Nav.new
      else
        @nav = Nav.new nav_params
      end
    end

    def create
      @nav = Nav.new nav_params
      if @nav.save
        redirect_to navs_path
      else
        render :new
      end
    end

    def show
      @nav = Nav.find params[:id]
    end

    def edit
      @nav = Nav.find params[:id]
    end

    def update
      @nav = Nav.find params[:id]
      if @nav.update_attributes nav_params
        redirect_to navs_path
      else
        render :edit
      end
    end

    def destroy
      @nav = Nav.find params[:id]
      @nav.destroy
      redirect_to navs_path
    end

    def move_up
      @nav = Nav.find params[:id]
      @nav.move_up
      redirect_to navs_path
    end

    def move_down
      @nav = Nav.find params[:id]
      @nav.move_down
      redirect_to navs_path
    end

    private
    def nav_params
      params.require(:nav).permit(:title, :url, :nav_id)
    end
  end
end
