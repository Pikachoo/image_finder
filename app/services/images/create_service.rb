require "net/http"
require "uri"
module Images

  class CreateService

    def execute(file)

      image = Image.create(file: file)

      generate_bluemix_tags(image, image.file.path)
      generate_bluemix_tags(image, image.file.thumb.path) if image.tags.size == 0
      ImageTag.create(tag: Tag.default, image: image, score: 1) if image.tags.size == 0

      image
    end

    private

    def generate_bluemix_tags(image, file_path)
      api_key = Rails.application.secrets.secret_key_watson
      url = "https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classify?api_key="+
          api_key + "&version=2016-05-20"

      c = Curl::Easy.new(url)
      c.multipart_form_post = true
      c.http_post(Curl::PostField.file('images_fild', file_path))

      response_hash = ActiveSupport::JSON.decode(c.body_str)

      if response_hash
        response_hash["images"].each do |item|
          item["classifiers"].each do |classifier|
            classifier["classes"].each do |tag_item|
              tag = Tag.find_by(name: tag_item["class"])
              tag = Tag.create(name: tag_item["class"]) unless tag
              ImageTag.create(tag: tag, image: image, score: tag_item["score"])
            end
          end
        end
      end

      response_hash
    end
  end
end
