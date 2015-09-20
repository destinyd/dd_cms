module DdCms
  class Nav
    include Mongoid::Document
    include Mongoid::Timestamps
    include Kaminari::MongoidExtension::Document
    include DdCms::Concerns::MovePosition

    field :title, type: String
    field :url, type: String

    belongs_to :nav, class_name: 'DdCms::Nav', inverse_of: :navs
    has_many :navs, class_name: 'DdCms::Nav', inverse_of: :nav

    validates :title, presence: true
    validates :url, presence: true

    scope :root, -> { where(nav_id: nil) }

    def parent
      nav
    end

    def self.parent_id_name
      'nav_id'
    end
  end
end
