require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/general.rb")
also_reload("../models/*")

# index
get "/generals" do
  @generals = General.all()
  erb(:"generals/index")
end

# # new
# get "/legions/new" do
#   erb(:"legions/new")
# end

# show
get "/generals/:id" do
  @general = General.find_by_id(params["id"].to_i())
  erb(:"generals/show")
end

# # create
# post "/legions" do
#   @legion = Legion.new(params)
#   @legion.save()
#   erb(:"legions/create")
# end
#
# # delete
# post "/legions/:id/delete" do
#   @legion = Legion.find_by_id(params["id"].to_i())
#   @legion.delete()
#   redirect "/legions"
# end
#
# # edit
# get "/legions/:id/edit" do
#   @legion = Legion.find_by_id(params["id"].to_i())
#   erb(:"legions/edit")
# end
#
# # update
# post "/legions/:id" do
#   @legion = Legion.new(params)
#   @legion.update()
#   redirect "/legions/#{@legion.id()}"
# end
