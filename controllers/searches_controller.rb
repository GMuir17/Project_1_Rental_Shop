require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/legion.rb")
require_relative("../models/general.rb")
require_relative("../models/deployment.rb")
also_reload("../models/*")

# get "/search" do
#   @legions = Legion.all()
#   for legion in @legions
#     if params["name"] == legion.name()
#       erb(:"/legion/show")
#     end
#   end
# end

get "/search" do
  erb(:"/searches/search")
end
