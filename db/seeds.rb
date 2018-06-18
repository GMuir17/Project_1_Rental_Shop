require_relative("../models/legion.rb")
require_relative("../models/general.rb")
require("pry")

Legion.delete_all()
General.delete_all()

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

general1 = General.new({
  "name" => "Marcus Agrippa",
  "reputation" => 10
  })
general1.save()

general2 = General.new({
  "name" => "Marc Antony",
  "reputation" => 6
  })
general2.save()


binding.pry
nil
