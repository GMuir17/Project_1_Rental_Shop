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

  def test_has_id()
    assert_equal(1, @legion1.id())
  end

  def test_has_strength()
    assert_equal(10, @legion1.strength())
  end

end
