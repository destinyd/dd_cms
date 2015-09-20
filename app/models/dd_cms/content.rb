module DdCms
  class Content
    include Mongoid::Document
    include Mongoid::Timestamps
    include Kaminari::MongoidExtension::Document

    field :title, type: String
    field :slug, type: String
    field :content_body, type: String

    field :type, type: String

    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true
    validates :content_body, presence: true

    scope :recent, -> { desc(:id)}
  end
end

