module Contexts
    module Projects
      def create_projects
        @Eon            = FactoryGirl.create(:project)
        @EndersGame     = FactoryGirl.create(:project, title: "Ender' Game", owner_id: 2, genre: "Science Fiction")
        @EndersS        = FactoryGirl.create(:project, title: "Ender's Shadow", owner_id: 2, genre: "Science Fiction")
        @Eragon         = FactoryGirl.create(:project, title: "Eragon", owner_id: 3, genre: "Fantasy", start_date: 1.year.ago.to_date , end_date: Date.today, status: "complete")
        @TPB            = FactoryGirl.create(:project, title: "The Princess Bride", owner_id: 4, genre: "Fantasy", start_date: 2.years.ago.to_date , end_date: 1.year.ago.to_date, status: "complete")
        @ml             = FactoryGirl.create(:project, title: "My Life", owner_id: 5, genre: "Autobiography", category: "Nonfiction")
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