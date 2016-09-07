class Admin::ScheduleOccurrenceController < Admin::AdminController

  before_action :authorize_superuser!

  def update
    schedule_occurrence = ScheduleOccurrence.find(params[:id])
    schedule_occurrence.update(
      params.require(:schedule_occurrence).permit(:canceled))

    redirect_to :back
  end
end
