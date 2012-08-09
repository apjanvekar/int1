require File.dirname(__FILE__) + '/../test_helper'
require 'displayscrollmessage_controller'

# Re-raise errors caught by the controller.
class DisplayscrollmessageController; def rescue_action(e) raise e end; end

class DisplayscrollmessageControllerTest < Test::Unit::TestCase
  def setup
    @controller = DisplayscrollmessageController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
