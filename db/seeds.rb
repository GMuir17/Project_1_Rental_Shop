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

legion3 = Legion.new({
  "name" => "Praetorian Guard",
  "strength" => 10,
  "moto" => "Kingmakers"
  })
legion3.save()

legion4 = Legion.new({
  "name" => "The 9th",
  "strength" => 4,
  "moto" => "The Lost Legion"
  })
legion4.save()


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

general3 = General.new({
  "name" => "Aemilius Lepidus",
  "reputation" => 8
  })
general3.save()


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

deployment3 = Deployment.new({
  "legion_id" => legion4.id(),
  "general_id" => general1.id(),
  "start_date" => "45BC",
  "campaign_length" => 2
  })
deployment3.save()

# p deployment3.returned()

binding.pry
nil
