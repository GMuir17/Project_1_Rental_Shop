require_relative("../db/sql_runner.rb")

class Legion

  attr_reader(:id, :name, :strength)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @strength = options["strength"].to_i()
  end








end
