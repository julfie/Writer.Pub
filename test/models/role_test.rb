require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test relationships
  # none

  # test validations with matchers
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive
  
  context "Within context" do
    setup do 
      create_roles
    end
    
    teardown do
      destroy_roles
    end

    should "have a scope to alphabetize roles" do
      assert_equal ["Artist", "Editor", "Writer"], Role.alphabetical.all.map(&:name)
    end

    should "have a scope to return active roles" do
      assert_equal ["Editor", "Writer"], Role.active.all.map(&:name).sort
    end 

    should "have a scope to return inctive roles" do
      assert_equal ["Artist"], Role.inactive.all.map(&:name).sort
    end 

    should "only allow unique new roles" do
      @bad_role = FactoryGirl.build(:role, name:"Editor", active:true)
      deny @bad_role.valid?
    end

    should "allow roles to switch between active and inactive" do
      @editor.make_inactive
      deny @editor.active
    end

    should "a role becomming inactive should not affect those who already have the role" do
      create_users
      create_projects
      create_project_roles

      @editor.make_inactive
      assert_equal @pr1.user_id, 4

      destroy_project_roles
      destroy_projects
      destroy_users
    end

  end
end
