module JsonRespondersHelper
  def render_json_api(resource, options = {})
    options[:adapter] ||= :json_api
    options[:namespace] ||= namespace_path
    options[:key_transform] ||= :camel_lower
    options[:serialization_context] ||= ActiveModelSerializers::SerializationContext.new(request)
    ActiveModelSerializers::SerializableResource.new(resource, options)
   end

  def render_success(status, resource, options = {})
    render json: render_json_api(resource, options).as_json, status: status
  end

  def render_error(status, errors = [], meta = {})
    if errors.is_a?(ActiveModel::Errors)
      render json: { errors: errors.full_messages, meta: meta }, status: status
    else
      render json: { errors: errors, meta: meta }, status: status
    end
  end

  def namespace_path
  end
end
