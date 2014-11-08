v1 = File.expand_path('v1', File.dirname(__FILE__))
$: << v1 unless $:.include?(v1)

module Api
  class V1 < App
    version 'v1', using: :header, vendor: 'infl'

    require 'users'
    require 'wingdings'

    mount Users => '/users'
    namespace :wingdings do
      mount Wingdings => 'w' # this will yield /w/special/wingdings (special comes from wingdings prefix)
    end
  end

  class V2 < App
    version 'v2', using: :header, vendor: 'infl'
  end
end
