# require needed files
require './test/sets/projects'
require './test/sets/roles'
require './test/sets/project_roles'
require './test/sets/users'
require './test/sets/messages'
require './test/sets/user_roles'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Projects
  include Contexts::Roles
  include Contexts::Project_Roles
  include Contexts::Users
  include Contexts::Messages
  include Contexts::UserRoles
end