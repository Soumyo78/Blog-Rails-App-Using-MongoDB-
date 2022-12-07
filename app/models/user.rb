class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :name, type: String
  field :email, type: String

  has_mongoid_attached_file :avatar

  validates :name, :email, presence: true
  validates :email, uniqueness: :true
  validates_attachment :avatar, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }

  def avatar_url
    avatar.url unless avatar.blank?
  end
end
