module Contexts
    module Project_Roles
      # Context for projects (assumes contexts for domains, users)
      def create_project_roles
        @p21     = FactoryGirl.create(:project_role)
        @pr2     = FactoryGirl.create(:project_role, project_id: 2, role_id: 2, user_id: 2, invite_num: 2)
        @pr3     = FactoryGirl.create(:project_role, project_id: 3, role_id: 3, user_id: nil, invite_num: 3)
    end
      
      def destroy_project_roles
        @pr1.destroy
        @pr2.destroy
        @pr3.destroy
      end
    end
  end