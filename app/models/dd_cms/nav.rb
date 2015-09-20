module DdCms
  class Nav
    include Mongoid::Document
    include Mongoid::Timestamps
    include Kaminari::MongoidExtension::Document
    include DdCms::Concerns::MovePosition

    field :title, type: String
    field :url, type: String

    belongs_to :nav
    has_many :navs

    scope :root, -> { where(nav_id: nil) }

    def parent
      nav
    end

    def self.parent_id_name
      'nav_id'
    end
  end
end
