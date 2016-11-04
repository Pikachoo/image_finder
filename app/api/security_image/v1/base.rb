module SecurityImage
  module V1
    class Base < Grape::API
      version 'v1', using: :path

      # before do
      #   server_token = Rails.application.config.auth_token
      #   request_token = request.headers['X-Auth-Token'].to_s
      #   unless ActiveSupport::SecurityUtils.secure_compare(server_token, request_token)
      #     error!('Invalid auth token.', 401)
      #   end
      # end

      rescue_from ActiveRecord::ActiveRecordError do |error|
        error!(error.message, 422)
      end

      mount SecurityImage::V1::Tags
    end
  end
end
