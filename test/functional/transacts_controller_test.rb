require File.dirname(__FILE__) + '/../test_helper'
require 'transacts_controller'

# Re-raise errors caught by the controller.
class TransactsController; def rescue_action(e) raise e end; end

class TransactsControllerTest < Test::Unit::TestCase
  fixtures :transacts

  def setup
    @controller = TransactsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = transacts(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:transacts)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:transact)
    assert assigns(:transact).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:transact)
  end

  def test_create
    num_transacts = Transact.count

    post :create, :transact => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_transacts + 1, Transact.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:transact)
    assert assigns(:transact).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Transact.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Transact.find(@first_id)
    }
  end
end
