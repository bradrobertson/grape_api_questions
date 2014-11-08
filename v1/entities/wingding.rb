module Api
  module V1::Entities
    class Wingding < Grape::Entity
      expose :foo, documentation: {type: 'string'}
      expose :bar, documentation: {type: 'integer'}
    end

    class WingdingParams < Grape::Entity
      expose :foo,   documentation: {type: 'string',  required: true}
      expose :bar,   documentation: {type: 'integer', required: true}
      expose :baz,   documentation: {type: 'boolean', required: true}
      expose :bing,  documentation: {type: "big_decimal"}
    end
  end
end
