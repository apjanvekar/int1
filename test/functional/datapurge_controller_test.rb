require File.dirname(__FILE__) + '/../test_helper'
require 'datapurge_controller'

# Re-raise errors caught by the controller.
class DatapurgeController; def rescue_action(e) raise e end; end

class DatapurgeControllerTest < Test::Unit::TestCase
  def setup
    @controller = DatapurgeController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
