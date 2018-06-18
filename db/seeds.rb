require_relative("../models/legion.rb")
require("pry")

Legion.delete_all()

legion1 = Legion.new({
  "name" => "The 17th",
  "strength" => 5,
  "moto" => "Beware the Teutoburg Forest"
  })
legion1.save()

# legion2 = L


binding.pry
nil
