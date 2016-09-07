class Admin::LearningRegistrySubmissionsController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    @submissions = LearningRegistrySubmission.pending.joins(:resource)
  end

  def update
    @submission = LearningRegistrySubmission.find(params[:id])

    if params[:approve] == "false"
      @submission.reject
    elsif params[:approve] == "true"
      @submission.approve
    end

    redirect_to admin_learning_registry_submissions_path
  end
end
