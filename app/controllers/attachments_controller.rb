class AttachmentsController < ApplicationController

	# Ensure that the user is logged in before uploading any docs
	before_action :authenticate_user!

	def new
		@attachment = current_user.attachments.build
	end

	def create
		@attachment = current_user.attachments.new(attachment_params)
		if @attachment.save
  	  render json: { message: "success" }, :status => 200
  	else
  	  #  you need to send an error header, otherwise Dropzone
          #  will not interpret the response as an error:
  	  render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
  	end 
	end

	def index
		@attachments = Attachment.all
	end

	def destroy
		@attachment = Attachment.find(params[:id])
		if @attachment.destroy
			render json: { message: "Attachment deleted succesfully"}, status: 200
		else
			render json: { error: @attachment.errors.full_messages.join(',')}, :status => 400
  	end 
  end

  def edit
  	@attachment = Attachment.find(params[:id])
  	render json: { content: (render_to_string partial: 'form', layout: false ) } 
  end

  def update
  	@attachment = Attachment.find(params[:id])
  	extension = File.extname(params[:attachment][:file_name])
  	new_name = params[:attachment][:file_name] + (extension ? '' : File.extname(@attachment.media_file_name))
  	@attachment.update_attributes!(media_file_name: new_name)
  	# if @attachment.update_attributes(media_file_name: new_name)
  	# 	render json: {message: 'File renamed succesfully'}, status: 200
  	# else
  	# 	render json: { error: @attachment.errors.full_messages.join(',')}, :status => 400
  	# end
  end


	private

	def attachment_params
		params.require(:attachment).permit(:media) if params[:attachment].present?
	end
end
