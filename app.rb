require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/legions_controller")
require_relative("controllers/generals_controller")
require_relative("controllers/deployments_controller")

get '/' do
  erb(:home)
end
