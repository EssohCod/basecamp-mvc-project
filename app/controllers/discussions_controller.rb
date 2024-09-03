class DiscussionsController < ApplicationController
  before_action :set_project
  before_action :set_discussion, only: [:show, :destroy]

  def index
    @discussions = @project.discussions
  end
  
  def create
    @discussion = @project.discussions.build(discussion_params)
    @discussion.user = current_user

    if @discussion.save
      redirect_to project_path(@project), notice: 'Discussion was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Discussion was successfully deleted.' }
      format.js   # Optional: Handle JS response if using AJAX
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_discussion
    @discussion = @project.discussions.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :content)
  end
end
