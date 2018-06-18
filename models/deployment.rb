require_relative("../db/sql_runner.rb")

class Deployment

  attr_reader(:id, :legion_id, :general_id, :start_date, :campaign_length, :returned)
  # attr_writer added to test update() method with pry
  # attr_writer(:campaign_length)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @legion_id = options["legion_id"].to_i()
    @general_id = options["general_id"].to_i()
    @start_date = options["start_date"]
    @campaign_length = options["campaign_length"].to_i()
    @returned = options["returned"]
  end


# instance variables
  def save()
    sql = "INSERT INTO deployments (
            legion_id,
            general_id,
            start_date,
            campaign_length)
          VALUES ($1, $2, $3, $4)
          RETURNING id;"
    values = [@legion_id, @general_id, @start_date, @campaign_length]
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
