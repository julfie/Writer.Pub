# module Contexts
#     module Project_Roles
#         def create_project_roles
#             @pr1     = FactoryGirl.create(:project_role, project_id: @ml, role_id: @artist, user_id: @evan)
#             @pr2     = FactoryGirl.create(:project_role, project_id: @Eon, role_id: @editor, user_id: @juliann, invite_num: 2)
#             @pr3     = FactoryGirl.create(:project_role, project_id: @EndersGame, role_id: @writer, user_id: nil, invite_num: 3)
#         end
        
#         def destroy_project_roles
#             @pr1.destroy
#             @pr2.destroy
#             @pr3.destroy
#         end
#     end
# end