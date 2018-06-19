require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/legion.rb")
require_relative("../models/general.rb")
require_relative("../models/deployment.rb")
also_reload("../models/*")

# index
get "/deployments" do
  @deployments = Deployment.all()
  erb(:"/deployments/index")
end
