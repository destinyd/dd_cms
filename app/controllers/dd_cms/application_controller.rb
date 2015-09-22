module DdCms
  class ApplicationController < ActionController::Base
    layout "dd_cms/application"
    before_filter :signed_in_or_redirect_to

    if defined? PlayAuth
      helper PlayAuth::SessionsHelper
      include PlayAuth::SessionsHelper
    end

    def signed_in_or_redirect_to
      return redirect_to(root_url + 'auth/login') if !user_signed_in?
    end
  end
end
