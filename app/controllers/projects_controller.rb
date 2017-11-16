class ProjectsController < ApplicationController
    # before_action :check_login, except [:index, :show]   
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    # respond_to :js, :html, :json

    def index
        @active_projects = Project.active.chronological.alphabetical.paginate(page: params[:page]).per_page(10)
        @completed_projects = Project.completed.chronological.alphabetical.paginate(page: params[:page]).per_page(10)
        @all_projects = Project.chronological.alphabetical#.paginate(page: params[:page]).per_page(10)
    end

    def show
        @project_team = @project.project_roles.filled
    end

    def new
        @project = Project.new
        @project.project_roles.build
        @last_project = Project.last
    end

    def edit
    end

    def categories
        @categories = Project.all.map{|p|p.category}.sort
        respond_to do |format|
            format.json {render json: @categories}
        end
    end

    def genre
        @categories = Project.all.map{|p|p.genre}.sort
        respond_to do |format|
            format.json {render json: @categories}
        end
    end

    def set_last_proj
        @last_project = Project.find(params[:project_id])
    end

    def create
        @project = Project.new(project_params)
        @project.start_date = Date.today
        @project.owner = @current_user  # set the owner to the user who created the project
    
        if @project.save
            # if saved to database
            @last_project = @project
            logger.info(@last_project.id)
            respond_to do |format|
                format.html { redirect_to @project, notice: "#{@project.title} has been created." }
                format.js {}
            end
        else
            # return to the 'new' form
			flash[:error] = "This project could not be created."
            render :action => 'new'
        end
    end

    def update
        if @project.update(project_params)
            flash[:notice] = "#{@project.title} has been updated."
            redirect_to @project
        elsif
            logger.info("last project ID is: ")
            logger.info(@last_project.id)
            @last_project.update(project_params)
            flash[:notice] = "#{@last_project.title} has been updated."
            redirect_to @last_project
        else
            render :action => 'edit'
        end
    end

    def destroy
        @project.destroy
        flash[:notice] = "Successfully removed #{@project.title}."
        redirect_to projects_url        
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.fetch(:project, {}).permit(:proj_description, :genre, :title, :category, :preview_level, :status, :start_date, :owner)
        # params.fetch[:start_date] = Date.today
        # params.fetch[:owner] = @current_user
    end

end
