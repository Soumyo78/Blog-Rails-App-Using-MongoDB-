class BaseSerializer < ActiveModel::Serializer
  def time_stamp
    object.created_at.strftime("%Y-%m-%d %I:%M%p") unless object.created_at.nil?
  end
end
