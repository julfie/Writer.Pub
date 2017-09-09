module Contexts
    module Projects
      # Context for projects (assumes contexts for domains, users)
      def create_projects
        @Eon            = FactoryGirl.create(:project)
        @EndersGame     = FactoryGirl.create(:project, title: "Enders Game", owner_id: "2", genre: "Science Fiction")
        @EndersS        = FactoryGirl.create(:project, title: "Enders Shadow", owner_id: "2", genre: "Science Fiction")
        @Eragon         = FactoryGirl.create(:project, title: "Eragon", owner_id: "3", genre: "Fantasy", start_date: 1.year.ago.to_date , end_date: 2.months.ago.to_date)
        @TPB            = FactoryGirl.create(:project, title: "The Princess Bride", owner_id: "4", genre: "Fantasy", start_date: 2.years.ago.to_date , end_date: 1.year.ago.to_date)
    end
      
      def destroy_projects
        @Eon.destroy
        @EndersGame.destroy
        @EndersS.destroy
        @Eragon.destroy
        @TPB.destroy
      end
    end
  end