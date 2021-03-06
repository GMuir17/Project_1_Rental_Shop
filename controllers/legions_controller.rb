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

# search
get "/legions/search" do
  erb(:"legions/search")
end

post "/legions/search" do
  @legion = Legion.find_by_name(params["name"])
  return erb(:"legions/no_result") if @legion == nil
  erb(:"legions/results")
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

# delete
post "/legions/:id/delete" do
  @legion = Legion.find_by_id(params["id"].to_i())
  if @legion.deployed? == true
    erb(:"legions/error")
  else
    @legion.delete()
    redirect "/legions"
  end
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
