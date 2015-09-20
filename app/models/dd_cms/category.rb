module DdCms
  class Category
    include Mongoid::Document
    include Mongoid::Timestamps
    include Kaminari::MongoidExtension::Document
    include DdCms::Concerns::MovePosition

    field :title, type: String

    belongs_to :category
    has_many :categories

    scope :root, -> { where(category_id: nil) }

    def parent
      category
    end

    def self.parent_id_name
      'category_id'
    end
  end
end

