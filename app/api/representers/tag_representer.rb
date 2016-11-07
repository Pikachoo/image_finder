module TagRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :name
  property :id
  property :images_html_url

end
