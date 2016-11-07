module ImageRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :file
  property :id
  collection :tags, extend: TagRepresenter, as: :tags, embedded: true

end
