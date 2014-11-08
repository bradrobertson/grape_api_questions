require 'entities/wingding'

module Api
  class V1::Wingdings < V1
    # Prefix for some reason works in this module, but not the main app one?
    prefix :special

    desc "create wingdings" do
      detail "anything"
      params Entities::Wingding.documentation
    end
    params do
      # Somehow these params apply to ALL routes in this file ??
      requires :something, type: String
      optional :else, type: String, documentation: {example: 'Something Else'}
    end
    post '/' do
      {"you" => "didit!"}
    end

# =================================

    helpers Module.new do
      extend Grape::API::Helpers

      params :pagination do
        optional :page, type: Integer
        optional :per_page, type: Integer
      end
    end

    desc "Some ya description"
    params do
      use :pagination
    end
    # For some reason, this route has :everything and :else params from above
    post '/things' do
    end

# ===================================

    desc "another way of creating"
    params do
      # I can't get this to work at all
      # Grape::Exceptions::UnknownValidator
      # requires :all, using: Entities::WingdingParams.documentation
      optional :all
    end
    # And finally, this route has :pagination and :something, :else params
    post "/thangs" do
    end
  end
end
