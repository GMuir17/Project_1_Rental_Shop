require_relative("../db/sql_runner.rb")

class General

  attr_reader(:id, :name, :reputation)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @reputation = options["reputation"]
  end

end
