require_relative("../db/sql_runner.rb")
require_relative("./deployment.rb")

class Legion

  attr_reader(:id, :name, :strength, :moto)
  # attr_writer added to test update() method with pry
  # attr_writer(:name)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @strength = options["strength"].to_i()
    @moto = options["moto"]
  end


# instance variables
  def save()
    sql = "INSERT INTO legions (
          name, strength, moto)
          VALUES ($1, $2, $3)
          RETURNING id;"
    values = [@name, @strength, @moto]
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

  def delete()
    sql = "DELETE FROM legions
          WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def deployed?()
    sql = "SELECT returned FROM deployments
          WHERE deployments.legion_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    return false if result == nil
    returned_result = result["returned"]
    if returned_result == "f"
      return true
    else
      return false
    end
  end


# class variables
  def self.delete_all()
    sql = "DELETE FROM legions;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM legions;"
    legions = SqlRunner.run(sql)
    result = legions.map {|legion| Legion.new(legion)}
    return result
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM legions WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    legion = Legion.new(results.first())
    return legion
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM legions WHERE name = $1;"
    values = [name]
    results = SqlRunner.run(sql, values)
    legion = Legion.new(results.first())
    return legion
  end

  def self.find_by_strength(strength)
    sql = "SELECT * FROM legions WHERE strength = $1;"
    values = [strength]
    results = SqlRunner.run(sql, values)
    legions = results.map {|legion| Legion.new(legion)}
    return legions
    # returns an array
  end

end
