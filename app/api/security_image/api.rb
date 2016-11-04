module SecurityImage
  class API < Grape::API
    prefix 'api'
    default_format :json
    format :json
    formatter :json, Grape::Formatter::Roar

    mount SecurityImage::V1::Base


  end
end
