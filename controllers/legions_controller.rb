require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/legion.rb")
also_reload("../models/*")

# index
get "/legions" do
  @legions = Legion.all()
  erb(:"legions/index")
end

# show
get "/legions/:id" do
  @legion = Legion.find_by_id(params["id"].to_i())
  erb(:"legions/show")
end
