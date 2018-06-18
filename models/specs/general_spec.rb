require("MiniTest/autorun")
require_relative("../general.rb")

class GeneralTest < MiniTest::Test

  def setup()
    options = {
      "name" => "Marcus Agrippa",
      "reputation" => 10
    }
    @general1 = General.new(options)
  end

  def test_has_name()
    assert_equal("Marcus Agrippa", @general1.name())
  end

end
