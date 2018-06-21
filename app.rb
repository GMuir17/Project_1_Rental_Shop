require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/legions_controller.rb")
require_relative("controllers/generals_controller.rb")
require_relative("controllers/deployments_controller.rb")
also_reload("../models/*")

get '/' do
  erb(:home)
end
