require File.dirname(__FILE__) + '/../test_helper'
require 'floorview_controller'

# Re-raise errors caught by the controller.
class FloorviewController; def rescue_action(e) raise e end; end

class FloorviewControllerTest < Test::Unit::TestCase
  def setup
    @controller = FloorviewController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
