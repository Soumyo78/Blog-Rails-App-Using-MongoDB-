class PostAttachment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Document filed-value schema
  # field :attachment_details, type: String
  # enum status: { header_image: 0, body_image: 1, content_document: 2 }, default: :body_image

  # Associations
  embedded_in :post, inverse_of: :post_attachments

  has_mongoid_attached_file :attachment

  # Validations
  validates_attachment :attachment, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif application/pdf) }
end
