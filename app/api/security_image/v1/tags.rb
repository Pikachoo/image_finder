module SecurityImage
  module V1
    class Tags < Grape::API
      resource :tags do
        desc 'List of tags' do

        end
        params do
          requires :search_name
        end
        get '/' do
          present Tag.order(:name).where('name like ?', "%#{params[:search_name]}%"), with: TagsRepresenter
        end

      end
    end
  end
end
