module DdCms
  class Post < Content
    belongs_to :category, class_name: 'DdCms::Category', inverse_of: :posts
    validates :category, presence: true
  end
end
