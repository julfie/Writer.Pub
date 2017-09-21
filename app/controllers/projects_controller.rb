class ProjectsController < ApplicationController

    def index
        @active_peojects = Project.active.chronological.alphabetical.paginate(page: params[:page]).per_page(10)
        @completed_projects = Project.completed.chronological.alphabetical.paginate(page: params[:page]).per_page(10)
        @all_projects = Project.chronological.alphabetical.paginate(page: params[:page]).per_page(10)
    end

    def show
        @project_team = @project.project_roles.filled
    end

    def new
        @project = Project.new
        @project.start_date = Date.today
        @project.owner = current_user.id
    end

    def edit
    end

    def create
        @project = Project.new(project_params)
        @project.owner = current_user.id  # set the owner to the user who created the project
    
        if @project.save
            # if saved to database
            flash[:notice] = "#{@project.name} has been created."
            redirect_to @project # go to show project page
        else
            # return to the 'new' form
            render :action => 'new'
        end
    end

    def update
        if @project.update(project_params)
            flash[:notice] = "#{@project.name} has been updated."
            redirect_to @project
        else
            render :action => 'edit'
        end
    end

    def destroy
    end

    private
        def project_params
            params.require(:project).permit(:owner_id, :proj_description, :genre, :title, :start_date, :end_date, :category, :preview_level)
        end

end
