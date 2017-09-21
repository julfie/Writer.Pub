class RolesController < ApplicationController

    def index
        @active_roles = Role.active.alphabetical.paginate(page: params[:page]).per_page(10)
        @inactive_roles = Role.inactive.alphabetical.paginate(page: params[:page]).per_page(10)
    end

    def show
    end

    def new
        @role = Role.new
        role.name = params[:name] unless params[:name].nil?
    end

    def create
        @role = Role.new(role_params)
        
        if @role.save
            respond_to do |format|
                format.html { redirect_to roles_path, notice: "Successfully added a role for #{@role.name}." }
                format.js
            end
        else
            render action: 'new'
        end
    end

    def destroy
    end

    private
    def purchase_params
        params.require(:role).permit(:name)
    end

end
