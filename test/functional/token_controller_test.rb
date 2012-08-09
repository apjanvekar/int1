require File.dirname(__FILE__) + '/../test_helper'
require 'token_controller'

# Re-raise errors caught by the controller.
class TokenController; def rescue_action(e) raise e end; end

class TokenControllerTest < Test::Unit::TestCase
  def setup
    @controller = TokenController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
