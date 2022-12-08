class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Document filed-value schema
  field :title, type: String
  field :content, type: String

  # Attachment files
  has_mongoid_attached_file :images

  # Associations
  belongs_to :user

  # Validations
  validates :title, :content, presence: true
  validates_attachment :images, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }
end
