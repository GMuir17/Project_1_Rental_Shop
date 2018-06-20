require_relative("../db/sql_runner.rb")

class General

  attr_reader(:id, :name, :reputation)
  # attr_writer added to test update() method with pry
  # attr_writer(:name)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @reputation = options["reputation"]
  end


  # instance variables
  def save()
    sql = "INSERT INTO generals (
          name, reputation)
          VALUES ($1, $2)
          RETURNING id;"
    values = [@name, @reputation]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end

  def update()
    sql = "UPDATE generals SET (
          name, reputation)
          =
          ($1, $2)
          WHERE id = $3;"
    values = [@name, @reputation, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM generals
          WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def deployed?()
    sql = "SELECT returned FROM deployments
          WHERE deployments.general_id = $1;"
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
    sql = "DELETE FROM generals;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM generals;"
    generals = SqlRunner.run(sql)
    result = generals.map {|general| General.new(general)}
    return result
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM generals WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    general = General.new(results.first())
    return general
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM generals WHERE name = $1;"
    values = [name]
    results = SqlRunner.run(sql, values)
    general = General.new(results.first())
    return general
  end

  def self.find_by_reputation(reputation)
    sql = "SELECT * FROM generals WHERE reputation = $1;"
    values = [reputation]
    results = SqlRunner.run(sql, values)
    generals = results.map {|general| General.new(general)}
    return generals
    # returns an array
  end

end
