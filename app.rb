require 'bundler'
Bundler.require(:default)

class Base < Grape::API
  # Note you'd think this would make routes look like /a/users
  # but they actually look like users/a, so apparently 'prefix'
  # means 'suffix' ??
  # It does however come before namespace below
  # prefix 'a'

  format :json
  default_format :json
end

class App < Grape::API
  require './api'
  # Namespace for some reason puts this at the END of the url, so namespace
  # means suffix also??
  # namespace 'b' do
    mount Api::V1 # mount Api::V1 => '/api' will yield /api/users etc...
    mount Api::V2
  # end
end

