require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/legion.rb")
require_relative("../models/general.rb")
require_relative("../models/deployment.rb")
also_reload("../models/*")

get "/search" do
  erb(:"/searches/search")
end

post "/search" do
  @legion = Legion.find_by_name(params["name"])
  return erb(:"/searches/no_result") if @legion == nil
  erb(:"/searches/results")
end
