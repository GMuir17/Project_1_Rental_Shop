require_relative("../db/sql_runner.rb")

class Legion

  attr_reader(:id, :name, :strength)
  attr_writer(:name)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @strength = options["strength"].to_i()
  end

# instance variables
  def save()
    sql = "INSERT INTO legions (
          name, strength)
          VALUES ($1, $2)
          RETURNING id;"
    values = [@name, @strength]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end

  def update()
    sql = "UPDATE legions SET (
          name, strength)
          =
          ($1, $2)
          WHERE id = $3;"
    values = [@name, @strength, @id]
    SqlRunner.run(sql, values)
  end


# class variables
  def self.delete_all()
    sql = "DELETE FROM legions;"
    SqlRunner.run(sql)
  end


end
