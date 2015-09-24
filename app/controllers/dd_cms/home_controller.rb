require 'ruby-pinyin'

module DdCms
  class HomeController < DdCms::ApplicationController
    def index

    end

    def permlink
      render text: PinYin.permlink(params[:title])
    end
  end
end
