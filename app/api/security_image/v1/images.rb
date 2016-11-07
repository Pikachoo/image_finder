module SecurityImage
  module V1
    class Images < Grape::API
      resource :images do
        desc 'List of images' do

        end
        params do
          requires :id
        end
        get '/' do
          present Image.includes(:tags).find(params[:id]), with: ImageRepresenter
        end

      end
    end
  end
end
