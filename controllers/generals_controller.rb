require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/general.rb")
also_reload("../models/*")

# index
get "/generals" do
  @generals = General.all()
  erb(:"generals/index")
end

# new
get "/generals/new" do
  erb(:"generals/new")
end

# show
get "/generals/:id" do
  @general = General.find_by_id(params["id"].to_i())
  erb(:"generals/show")
end

# create
post "/generals" do
  @general = General.new(params)
  @general.save()
  erb(:"generals/create")
end
#
# # delete
# post "/legions/:id/delete" do
#   @legion = Legion.find_by_id(params["id"].to_i())
#   @legion.delete()
#   redirect "/legions"
# end

# edit
get "/generals/:id/edit" do
  @general = General.find_by_id(params["id"].to_i())
  erb(:"generals/edit")
end

# # update
# post "/legions/:id" do
#   @legion = Legion.new(params)
#   @legion.update()
#   redirect "/legions/#{@legion.id()}"
# end
