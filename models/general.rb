require_relative("../db/sql_runner.rb")

class General

  attr_reader(:id, :name, :reputation)

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

    def delete()
      sql = "DELETE FROM generals
            WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
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

end
