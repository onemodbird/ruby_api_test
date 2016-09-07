class Admin::ChatPromosController < Admin::AdminController

  before_action :authorize_superuser!
  helper_method :classes_for_promo

  def index
    @chat_promo = ChatPromo.new
    @chat_promos = ChatPromo.enabled
    @occurrences = get_occurrences
  end

  def create
    ChatPromo.create!(params[:chat_promo].permit(:key, :kind, :time_offset, :text, :image_file))
    redirect_to :back
  end

  def destroy
    ChatPromo.find(params[:id]).disable
    redirect_to :back
  end

  def cancel_message
    ScheduledMessage.find(params[:message_id]).cancel
    render json: { canceled: params[:message_id] }
  end

  def get_occurrences
    ScheduleOccurrence
      .includes(:schedulable, :scheduled_promos)
      .between(Time.now - 2.hours, Time.now + 1.day)
      .order(:start_time)
  end

  private

  def classes_for_promo(promo)
    classes = case promo.chat_promo.kind
      when "start" then ["alert-success"]
      when "end" then ["alert-danger"]
      else ["alert-warning"]
    end

    classes << "canceled" if promo.canceled?

    classes
  end
end
