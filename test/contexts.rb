# require needed files
require './test/sets/projects'
require './test/sets/roles'
require './test/sets/project_roles'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Projects
  include Contexts::Roles
  include Contexts::Project_Roles
end