class PostSerializer < BaseSerializer
  attributes :id, :title, :content, :time_stamp, :file_attachments

  belongs_to :user
end
