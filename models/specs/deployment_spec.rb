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

  def test_has_legion_id()
    assert_equal(2, @deployment1.legion_id())
  end

  def test_has_general_id()
    assert_equal(3, @deployment1.general_id())
  end

  def test_has_start_date()
    assert_equal("19BC", @deployment1.start_date())
  end

  def test_has_campaign_length()
    assert_equal(4, @deployment1.campaign_length())
  end

  def test_has_returned()
    assert_equal(false, @deployment1.returned())
  end

  def test_bool_to_text__false
    assert_equal("No", @deployment1.bool_to_text())
  end

  def test_bool_to_text__true
    options = {
      "id" => 1,
      "legion_id" => 2,
      "general_id" => 3,
      "start_date" => "19BC",
      "campaign_length" => 4,
      "returned" => true
    }
    deployment1 = Deployment.new(options)
    assert_equal("Yes", deployment1.bool_to_text())
  end

end
