module Api
  module V1::Entities
    class User < Grape::Entity
      expose :name,  documentation: {type: "string", desc: "User name"}
      expose :email, documentation: {type: 'string', desc: 'User email'}
    end

    class UserParams < Grape::Entity
      expose :name,  documentation: {type: String, required: true}
      expose :email, documentation: {type: 'string', required: true}
      expose :role,  documentation: {type: 'string', required: true, values: ['admin', 'plebeian'] }
      expose :age,   documentation: {type: 'integer'}
    end
  end
end
