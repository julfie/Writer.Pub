module Contexts
    module Roles
      def create_roles
        @editor     = FactoryGirl.create(:role)
        @writer     = FactoryGirl.create(:role, name: "Writer", active: true)
        @artist     = FactoryGirl.create(:role, name: "Artist", active: false)
    end
      
      def destroy_roles
        @Editor.destroy
        @writer.destroy
        @artist.destroy
      end
    end
  end