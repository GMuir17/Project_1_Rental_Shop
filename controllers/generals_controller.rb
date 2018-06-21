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

# search
get "/generals/search" do
  erb(:"generals/search")
end

post "/generals/search" do
  @general = General.find_by_name(params["name"])
  return erb(:"generals/no_result") if @general == nil
  erb(:"generals/results")
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

# delete
post "/generals/:id/delete" do
  @general = General.find_by_id(params["id"].to_i())
  if @general.deployed? == true
    erb(:"generals/error")
  else
    @general.delete()
    redirect "/generals"
  end
end

# edit
get "/generals/:id/edit" do
  @general = General.find_by_id(params["id"].to_i())
  erb(:"generals/edit")
end

# update
post "/generals/:id" do
  @general = General.new(params)
  @general.update()
  redirect "/generals/#{@general.id()}"
end
