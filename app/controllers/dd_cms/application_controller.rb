module DdCms
  class ApplicationController < ActionController::Base
    layout "dd_cms/application"

    if defined? PlayAuth
      helper PlayAuth::SessionsHelper
    end
  end
end