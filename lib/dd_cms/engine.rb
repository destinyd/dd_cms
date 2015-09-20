module DdCms
  class Engine < ::Rails::Engine
    isolate_namespace DdCms
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper
    end
  end
end