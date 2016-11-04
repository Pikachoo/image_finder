module TagRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :name
end
