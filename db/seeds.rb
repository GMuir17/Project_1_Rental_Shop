require_relative("../models/legion.rb")
require_relative("../models/general.rb")
require_relative("../models/deployment.rb")
require("pry")

Deployment.delete_all()
Legion.delete_all()
General.delete_all()

# legions
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

# generals
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

# deployments
deployment1 = Deployment.new({
  "legion_id" => legion2.id(),
  "general_id" => general1.id(),
  "start_date" => "45BC",
  "campaign_length" => 2
  })
deployment1.save()

deployment2 = Deployment.new({
  "legion_id" => legion1.id(),
  "general_id" => general2.id(),
  "start_date" => "47BC",
  "campaign_length" => 4
  })
deployment2.save()



binding.pry
nil
