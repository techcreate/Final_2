class JoinsController < ApplicationController
	def create
		group = Group.find(params['@group_id'])
		join = Join.create(user: current_user, group: group)
		redirect_to :back
	end

	def destroy
		join = Join.find(params[:id]).destroy
		redirect_to :back
	end
end
