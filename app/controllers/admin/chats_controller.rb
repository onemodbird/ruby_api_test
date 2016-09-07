class Admin::ChatsController < Admin::AdminController

  before_action :authorize_superuser!

  def create
    chat = Chat.create! create_params
    flash[:notice] = "Chat #{chat.name} created"
    redirect_to admin_chats_path
  end

  def index
    @chat = Chat.new
    @chats = Chat.order(:name)
    @message_counts =
      ChatMessage.group(:chat_id).pluck(:chat_id, "count(*)").to_h
  end

  def edit
    @chat = Chat.find(params[:id])
    @occurrences = chat_schedule_occurrences(@chat)
  end

  def update
    @chat = Chat.find(params[:id])
    @chat.description = update_params[:description]
    @chat.moderator_list = update_params[:moderator_list]
    @chat.spammers = update_params[:spammers].to_s.split(",").map(&:strip)
    @chat.promos_enabled = update_params[:promos_enabled] == "1"
    @chat.edcamp = update_params[:edcamp] == "1"

    Schedulable::Params.apply(@chat, update_params)

    if schedule_duration_is_required
      @occurrences = chat_schedule_occurrences(@chat)
      render(:edit)
      return
    end

    warn_if_duration_is_discarded

    @chat.save! if @chat.changed?

    redirect_to admin_chats_path
  end

  def archive
    @chat = Chat.find(params[:id])
    @chat.archive!

    redirect_to admin_chats_path
  end

  private

  def chat_schedule_occurrences(chat)
    ScheduleOccurrence
      .where(schedulable_id: chat.id)
      .where("end_time > ?", Time.zone.now)
      .order(:start_time)
  end

  def create_params
    params.require(:chat).permit(:name, :description).tap do |params|
      params[:name] = Chat.normalize_hashtag(params.fetch(:name))
    end
  end

  def update_params
    params.require(:chat).permit(
      :description,
      :schedule_duration,
      :moderator_list,
      :spammers,
      :promos_enabled,
      :edcamp,
      schedule_times: [],
      schedule_rules: [],
      schedule_single_occurrence_times: [],
      schedule_single_occurrence_dates: []
    )
  end

  def schedule_duration_is_required
    if ( @chat.schedule&.recurrence_rules&.any? ||
         @chat.schedule&.recurrence_times&.any? ) &&
         update_params[:schedule_duration].to_i == 0

      flash[:error] = "When setting a schedule, duration is required"
    end
  end

  def warn_if_duration_is_discarded
    duration = update_params[:schedule_duration].to_i

    if @chat.schedule.nil? && duration > 0
      flash[:warning] = "Duration of " <<
        "#{duration} was discarded " <<
        "for chat #{@chat.name} " <<
        "because no schedule recurrence rules or one-time events were defined"
    end
  end
end
