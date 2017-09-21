# require needed files
require './lib/tasks/helpers/Projects'
require './lib/tasks/helpers/Roles'
require './lib/tasks/helpers/Project_Roles'



module Populator
  
  include Populator::Projects
  include Populator::Roles
  include Populator::Project_Roles

end
