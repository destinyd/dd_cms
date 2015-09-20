module DdCms
  class Post < Content
    belongs_to :category
    validates :category, presence: true
  end
end
