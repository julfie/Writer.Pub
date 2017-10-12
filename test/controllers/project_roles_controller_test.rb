require "test_helper"

class ProjectRolesControllerTest < ActionController::TestCase
  def project_role
    @project_role ||= project_roles :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:project_roles)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("ProjectRole.count") do
      post :create, project_role: {  }
    end

    assert_redirected_to project_role_path(assigns(:project_role))
  end

  def test_show
    get :show, id: project_role
    assert_response :success
  end

  def test_edit
    get :edit, id: project_role
    assert_response :success
  end

  def test_update
    put :update, id: project_role, project_role: {  }
    assert_redirected_to project_role_path(assigns(:project_role))
  end

  def test_destroy
    assert_difference("ProjectRole.count", -1) do
      delete :destroy, id: project_role
    end

    assert_redirected_to project_roles_path
  end
end
