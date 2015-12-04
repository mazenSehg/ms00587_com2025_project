class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@pin = Pin.find(params[:pin_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.pin_id = @pin.id

		if @comment.save
			redirect_to pin_path(@pin)
		else
			render 'new'
		end
	end

	def destroy
		@pin = Pin.find(params[:pin_id])
		@comment = Comment.destroy(params[:comment].permit(:content))
		redirect_to root_path
	end

end
