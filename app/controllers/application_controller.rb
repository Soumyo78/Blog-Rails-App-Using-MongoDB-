class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include JsonRespondersHelper

  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  # rescue_from ArgumentError, with: :argument_error
  # rescue_from ActiveRecord::SubclassNotFound, with: :sub_class_not_found
  # rescue_from AbstractController::ActionNotFound, with: :action_not_found
  # rescue_from ActionController::RoutingError, with: :routing_error
  # rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  # rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_destroyed
  # rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  # rescue_from ActiveRecord::StatementInvalid, with: :statement_invalid
  # rescue_from NameError, with: :name_error
  rescue_from NoMethodError, with: :no_method_error

  def no_attachments
    # Do nothing
  end

  private
    def not_found(exception)
      render status: 404, json: { errors: { message: "not_found" }, meta: { message: "Document not found." } }
    end

    def parameter_missing(exception)
      render_error(422, {}, message: "Some data are missing.")
    end

    # def argument_error(exception)
    #   render_error(422, {}, message: "Invalid data.")
    # end

    # def sub_class_not_found(exception)
    #   render_error(422, {}, message: "Not a valid class.")
    # end

    # def action_not_found(exception)
    #   render_error(404, {}, message: "Invalid request.")
    # end

    # def routing_error(exception)
    #   render_error(404, {}, message: "Invalid request.")
    # end

    # def record_not_unique(exception)
    #   render_error(404, {}, message: "Not allowed to create duplicate record.")
    # end

    # def record_not_destroyed(exception)
    #   render_error(500, {}, message: "Unable to destroy.")
    # end

    # def record_invalid
    #   render_error(404, {}, message: "Invalid record.")
    # end

    # def statement_invalid
    #   render_error(404, {}, message: "Invalid field value.")
    # end

    # def name_error
    #   render_error(404, {}, message: "Uninitialized Constant.")
    # end

    def no_method_error(exception)
      render_error(405, exception, message: "No method exception.")
    end
end
