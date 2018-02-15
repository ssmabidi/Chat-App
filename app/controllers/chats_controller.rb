class ChatsController < ApplicationController

	before_action :authenticate_user!
	
	def index
	end

	def showchat
		@receiver_id = params[:user_id]
		render :partial => 'showchat'
	end

	def create
		@message = Message.new(user_params)
		if @message.save
			redirect_to :back
		else
			flash[:alert] ="Something went wrong"
			redirect_to :back
		end
	end

	def edit
	end

	def show
	end

	def update
	end

	def destroy
	end


	private

	  def user_params
	    params.require(:message).permit(:message, :receiver_id).merge(sender_id: current_user.id)
	  end
end
