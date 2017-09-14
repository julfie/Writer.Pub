require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test relationships
  # none

  # test validations with matchers
  should validate_presence_of(:name)
  should validate_presence_of(:active)
  should validate_uniqueness_of(:name).case_insensitive
  
  context "Within context" do
    setup do 
      create_roles
      create_users
      create_user_roles
    end
    
    teardown do
      destroy_roles
      destroy_users
      destroy_user_roles
    end

    should "have a scope to alphabetize roles" do
      assert_equal ["Artist", "Editor", "Writer"], Roles.alphabetical.all.map(&:name)
    end

    should "have a scope to return active roles" do
      assert_equal ["Editor", "Writer"], Roles.active.all.map(&:name).sort
    end 

    should "have a scope to return inctive roles" do
      assert_equal ["Artist"], Roles.inactive.all.map(&:name).sort
    end 

    should "only allow unique new roles" do
      @bad_role = FactoryGirl.build(:role, name:"Editor", active:True)
      deny @bad_role.valid?
    end

    should "allow roles to switch between active and inactive" do
      @editor.make_active
      assert @editor.active = False
    end

    should "a role becomming inactive should not affect those who already have the role" do
      @editor.make_inactive
      assert_equal @albert.role, "Editor"
    end

  end
end
