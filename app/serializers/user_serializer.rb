class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :time_stamp, :avatar_url

  has_many :posts

  def time_stamp
    object.created_at.strftime("%Y-%m-%d %I:%M%p") unless object.created_at.nil?
  end
end
