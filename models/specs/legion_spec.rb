require("MiniTest/autorun")
require_relative("../legion.rb")

class LegionTest < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "name" => "The 9th",
      "strength" => 10
    }
    @legion1 = Legion.new(options)
  end

  def test_has_name()
    assert_equal("The 9th", @legion1.name())
  end

end
