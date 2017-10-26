class UsersController < ApplicationController
  # authorize_resource
  before_action :check_login, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.alphabetical.paginate(:page => params[:page]).per_page(7)
	end

	def show
		@user_projects = @user.projects.active.chronological
		@project_roles = @user.user_roles.map{r|r.name}.sort
		@current_projects = @user.projects.active.alphabetical
		@past_projects = @user.projects.completed.alphabetical
    #@messages
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
    @user = User.new(user_params)
    @user.active = true

		if @user.save
			session[:user_id] = @user.id
			redirect_to home_path, notice: "Thank you for signing up!"
		else
			flash[:error] = "This user could not be created."
			render "new"
		end
	end

	def update
		if @user.update_attributes(user_params)
			flash[:notice] = "#{@user.name} is updated."
			redirect_to @user
		else
			render :action => 'edit'
		end
	end

	def destroy
		@user.destroy
		flash[:notice] = "Successfully removed #{@user.name} from Users."
		redirect_to users_url
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.fetch(:user, {}).permit(:first_name, :last_name, :username, :email, :phone_number, :password, :password_confirmation)
	end
end
