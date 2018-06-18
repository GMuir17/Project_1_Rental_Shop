require("MiniTest/autorun")
require_relative("../general.rb")

class GeneralTest < MiniTest::Test

  def setup()
    options = {
      "id" => 2,
      "name" => "Marcus Agrippa",
      "reputation" => 10
    }
    @general1 = General.new(options)
  end

  def test_has_name()
    assert_equal("Marcus Agrippa", @general1.name())
  end

  def test_has_id()
    assert_equal(2, @general1.id())
  end

  def test_has_reputation()
    assert_equal(10, @general1.reputation())
  end

end
