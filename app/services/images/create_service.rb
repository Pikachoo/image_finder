require "net/http"
require "uri"
module Images


  class CreateService
    def execute(file)

      image = Image.create(file: file)

      api_key = Rails.application.secrets.secret_key_watson
      url =  "https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classify?api_key="+
             api_key + "&version=2016-05-20"

      c = Curl::Easy.new(url)
      c.multipart_form_post = true
      c.http_post(Curl::PostField.file('images_fild', image.file.thumb.path))

      response_hash = ActiveSupport::JSON.decode(c.body_str)

      response_hash["images"].each do |item|
        item["classifiers"].each do |classifier|
          classifier["classes"].each do |tag_item|
            tag =  Tag.find_by(name: tag_item["class"])
            tag =  Tag.create(name: tag_item["class"]) unless tag
            ImageTag.create(tag: tag, image: image, score: tag_item["score"])
          end
        end
      end

      image
    end
  end
end
