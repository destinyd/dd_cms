module DdCms
  class Category
    include Mongoid::Document
    include Mongoid::Timestamps
    include Kaminari::MongoidExtension::Document
    include DdCms::Concerns::MovePosition

    field :title, type: String

    belongs_to :category, class_name: 'DdCms::Category', inverse_of: :categories
    has_many :categories, class_name: 'DdCms::Category', inverse_of: :category
    has_many :posts, class_name: 'DdCms::Post', inverse_of: :category

    scope :root, -> { where(category_id: nil) }

    def parent
      category
    end

    def self.parent_id_name
      'category_id'
    end
  end
end

