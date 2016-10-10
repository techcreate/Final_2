class GroupsController < ApplicationController
	

	def index
		@groups = Group.all 
	end

	def show
		@group = Group.find(params[:id])
		@users = @group.users_joined
	end

	def create
		group  = Group.create(name: group_params['name'], description: group_params['description'], user_id: group_params['user_id'], user: current_user)
		flash["success"] = "Group added!" if group.save
		redirect_to current_user
	end

	def destroy
  	group = Group.find(params[:id])
  	group.destroy if group.user == current_user
  	redirect_to "/users/#{current_user.id}"

  end


	private
	def group_params
		params.require(:group).permit(:name, :description, :user_id)
	end
end
