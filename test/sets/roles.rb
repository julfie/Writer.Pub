module Contexts
    module Projects
      # Context for projects (assumes contexts for domains, users)
      def create_projects
        @editor     = FactoryGirl.create(:role)
        @writer     = FactoryGirl.create(:role, name: "Writer", active: true)
        @artist     = FactoryGirl.create(:role, name: "Artist", active: false)
    end
      
      def destroy_projects
        @Editor.destroy
        @writer.destroy
        @artist.destroy
      end
    end
  end