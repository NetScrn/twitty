class TwittyAPI < Grape::API
  format :json

  get :index do
    User.all.map(&:values)
  end
end
