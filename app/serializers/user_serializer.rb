class UserSerializer < BaseSerializer
  attributes :id, :name, :email, :time_stamp, :avatar_url

  # has_many :posts, unless: :exclude_assc?

  # def exclude_assc?
  #   instance_options[:serializer_context_class]
  # end
end
