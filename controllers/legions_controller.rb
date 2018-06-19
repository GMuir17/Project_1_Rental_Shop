require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/legion.rb")
also_reload("../models/*")

# index
get "/legions" do
  @legions = Legion.all()
  erb(:"legions/index")
end

# new
get "/legions/new" do
  erb(:"legions/new")
end

# show
get "/legions/:id" do
  @legion = Legion.find_by_id(params["id"].to_i())
  erb(:"legions/show")
end

# create
post "/legions" do
  @legion = Legion.new(params)
  @legion.save()
  erb(:"legions/create")
end

# edit
get "/legions/:id/edit" do
  @legion = Legion.find_by_id(params["id"].to_i())
  erb(:"legions/edit")
end

# update
post "/legions/:id" do
  @legion = Legion.new(params)
  @legion.update()
  redirect "/legions/#{@legion.id()}"
end
