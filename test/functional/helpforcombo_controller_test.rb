require File.dirname(__FILE__) + '/../test_helper'
require 'helpforcombo_controller'

# Re-raise errors caught by the controller.
class HelpforcomboController; def rescue_action(e) raise e end; end

class HelpforcomboControllerTest < Test::Unit::TestCase
  def setup
    @controller = HelpforcomboController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
