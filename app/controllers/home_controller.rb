class HomeController < ApplicationController
# authorize_resource

    def home
        @all_projects = Project.alphabetical.paginate(:page => params[:page]).per_page(6)
        @new_stories = Project.chronological.alphabetical.paginate(:page => params[:page]).per_page(6)
        @featured_stories = Project.chronological.alphabetical.paginate(:page => params[:page]).per_page(6)
        @bookshelf = Project.alphabetical.paginate(:page => params[:page]).per_page(6)
    end

    def about
    end

    def contact
    end

    def privacy
    end

end