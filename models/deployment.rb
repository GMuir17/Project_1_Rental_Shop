require_relative("../db/sql_runner.rb")

class Deployment

  attr_reader(:id, :legion_id, :general_id, :start_date, :campaign_length, :returned)
  # attr_writer added to test update() method with pry
  attr_writer(:campaign_length, :returned)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @legion_id = options["legion_id"].to_i()
    @general_id = options["general_id"].to_i()
    @start_date = options["start_date"]
    @campaign_length = options["campaign_length"].to_i()
    @returned = options["returned"] || false
  end


# instance variables
  def save()
    sql = "INSERT INTO deployments (
            legion_id,
            general_id,
            start_date,
            campaign_length,
            returned)
          VALUES ($1, $2, $3, $4, $5)
          RETURNING id;"
    values = [@legion_id, @general_id, @start_date, @campaign_length, @returned]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end

  def update()
    sql = "UPDATE deployments SET (
          campaign_length, returned)
          =
          ($1, $2)
          WHERE id = $3;"
    values = [@campaign_length, @returned, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM deployments
          WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def legion()
    sql = "SELECT * FROM legions
          WHERE id = $1;"
    values = [@legion_id]
    results = SqlRunner.run(sql, values)
    legion = Legion.new(results.first())
    return legion
  end

  def general()
    sql = "SELECT * FROM generals
          WHERE id = $1;"
    values = [@general_id]
    results = SqlRunner.run(sql, values)
    general = General.new(results.first())
    return general
  end

  def return_legion()
    @returned = true
    update()
  end

  def bool_to_text()
    if @returned == "f"
      return "No"
    else
      return "Yes"
    end
  end

# class variables
  def self.delete_all()
    sql = "DELETE FROM deployments;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM deployments;"
    deployments = SqlRunner.run(sql)
    result = deployments.map {|deployment| Deployment.new(deployment)}
    return result
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM deployments WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    deployment = Deployment.new(results.first())
    return deployment
  end


end
