module DdCms
  class Category
    include Mongoid::Document
    include Mongoid::Timestamps
    include Kaminari::MongoidExtension::Document
    include DdCms::Concerns::MovePosition

    field :title, type: String
    field :level, type: Integer, default: 0

    belongs_to :category, class_name: 'DdCms::Category', inverse_of: :categories
    has_many :categories, class_name: 'DdCms::Category', inverse_of: :category
    has_many :posts, class_name: 'DdCms::Post', inverse_of: :category

    scope :root, -> { where(category_id: nil) }

    def title_with_level
      @title_with_level ||= '|_' + ('_' * level) + title
    end

    # move position
    def parent
      category
    end

    def self.parent_id_name
      'category_id'
    end

    protected
    before_save :reset_level
    def reset_level
      level_count = 0
      c1 = self
      while c1.category
        level_count += 1
        c1 = c1.category
      end
      self.level = level_count
    end
  end
end

