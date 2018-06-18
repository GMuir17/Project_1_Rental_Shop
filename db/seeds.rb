require_relative("../models/legion.rb")
require("pry")

Legion.delete_all()

legion1 = Legion.new({
  "name" => "The 17th",
  "strength" => 5,
  "moto" => "Beware the Teutoburg Forest"
  })
legion1.save()

legion2 = Legion.new({
  "name" => "The 10th",
  "strength" => 10,
  "moto" => "Hail Caesar"
  })
legion2.save()


binding.pry
nil
