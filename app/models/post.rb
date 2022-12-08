class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :post_attachment_files
  after_save :perform_after_save

  # Document filed-value schema
  field :title, type: String
  field :content, type: String

  # Associations
  belongs_to :user
  embeds_many :post_attachments

  # Validations
  validates :title, :content, presence: true

  def perform_after_save
    if !post_attachment_files.blank? && post_attachment_files.kind_of?(Array)
      post_attachment_files.each do |post_attachment_file|
        self.post_attachments.create(attachment: post_attachment_file)
      end
    end
  end

  def file_attachments
    self.post_attachments.map do |post_attachment|
      {
        id: post_attachment.id.to_s,
        file_name: post_attachment.attachment_file_name.to_s,
        url: post_attachment.attachment.url
      }
    end
  end
end
