require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/legion.rb")
also_reload("../models/*")

get "/legions" do
  @legions = Legion.all()
  erb(:"legions/index")
end
