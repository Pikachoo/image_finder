module TagsRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  collection :entries, extend: TagRepresenter, as: :tags, embedded: true
end
