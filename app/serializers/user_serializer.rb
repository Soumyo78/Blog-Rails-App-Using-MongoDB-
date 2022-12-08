class UserSerializer < BaseSerializer
  attributes :id, :name, :email, :time_stamp, :avatar_url

  has_many :posts
end
