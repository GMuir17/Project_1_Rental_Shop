require("MiniTest/autorun")
require_relative("../deployment.rb")

class DeploymentTest < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "legion_id" => 2,
      "general_id" => 3,
      "start_date" => "19BC",
      "campaign_length" => 4,
      "returned" => false
    }
    @deployment1 = Deployment.new(options)
  end

  def test_has_id()
    assert_equal(1, @deployment1.id())
  end

end
