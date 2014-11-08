require 'entities/user'

module Api
  class V1::Users < V1

    desc "Returns a list of users" do
      detail 'Users index detail'
      failure [[401, 'Unauthorized', "Entities::Error"]]
      named 'User Index Named'
      headers(
        XAuthToken: {
          description: 'Validates your identity',
          required: true
        }
      )
    end
    get '/' do
      [ {name: 'xxx'}, {name: 'yyy'} ]
    end

# ===================================

    route_param :id do
      params do
        # Note that these params apply to the below get 'comments' also!!
        requires :id, type: Integer, desc: "you can describe this way too"
      end
      get do
        {name: 'zzz'}
      end

# ===================================

      desc "get user comments"
      get 'comments' do
        [
          {body: "that was awesome"}
        ]
      end
    end

# ===================================

    # Note:
    # using {type: String} in `desc` will yield actual string class in docs
    # but using {type: String} in `params` will stringify to {type: 'String'} ??
    #
    desc("Create user using params spec, desc as hash",
      detail: 'Create user w/ params detail',
      params: {
        these_are_from: {desc: 'the desc hash', type: 'string'},
        name: {type: 'String'},
        email: {type: 'String', required: true}
      },
      entity: Entities::User,
      failure: [[401, 'Unauthorized', "Entities::Error"]]
    )
    params do
      optional :sex, type: String, values: ['m', 'f']
    end
    post '/' do
    end

# ===================================

    desc "Create users using entity docs, desc as block" do
      detail 'Some More Details'
      params  Entities::UserParams.documentation
      success Entities::User
      failure [[401, 'Unauthorized', "Entities::Error"]]
      named 'Create Users Entity'
      headers(
        XAuthToken: {
          description: 'Validates your identity',
          required: true
        },
        XOptionalHeader: {
          description: 'Not really needed',
          required: false
        }
      )
    end
    # Note that for some reason the above 'sex' param from the above route is also added here??
    # along with the ones listed in the desc
    params do
      optional :flex, type: String
    end
    post '/some_other_path' do
      {some: "user"}
    end
  end
end
