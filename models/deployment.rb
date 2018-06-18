require_relative("../db/sql_runner.rb")

class Deployment

  attr_reader(:id, :legion_id, :general_id, :start_date, :campaign_length, :returned)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @legion_id = options["legion_id"].to_i()
    @general_id = options["general_id"].to_i()
    @start_date = options["start_date"]
    @campaign_length = options["campaign_length"].to_i()
    @returned = options["returned"]
  end




end
