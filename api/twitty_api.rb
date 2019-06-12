module Twitty
  class TwittyApp < Grape::API
    format :json

    get :index do
      {test: 'data'}
    end
  end
end