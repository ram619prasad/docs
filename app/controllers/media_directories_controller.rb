class MediaDirectoriesController < ApplicationController

	# Ensure that the user is logged in before uploading any docs
	before_action :authenticate_user!

	def new
		@media = MediaDirectory.new
	end

	def create
		@media = current_user.media_directories.new(media_params)
		respond_to do |format|
      if @media.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: {message: 'Created successfully', status: 200} }
        format.js   { }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
        # added:
        format.js   { }
      end
    end
	end

	private
	def media_params
		params.require(:media_directory).permit(:title)
	end

end
